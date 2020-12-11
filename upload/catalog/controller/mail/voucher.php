<?php
namespace Opencart\Application\Controller\Mail;
class Voucher extends \Opencart\System\Engine\Controller {
	public function index(&$route, &$args, &$output) {
		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($args[0]);

		// If order status in the complete range create any vouchers that where in the order need to be made available.
		if (in_array($order_info['order_status_id'], $this->config->get('config_complete_status'))) {
			// Send out any gift voucher mails
			$voucher_query = $this->db->query("SELECT *, vtd.name AS theme FROM `" . DB_PREFIX . "voucher` v LEFT JOIN `" . DB_PREFIX . "voucher_theme` vt ON (v.`voucher_theme_id` = vt.`voucher_theme_id`) LEFT JOIN `" . DB_PREFIX . "voucher_theme_description` vtd ON (vt.`voucher_theme_id` = vtd.`voucher_theme_id`) WHERE v.`order_id` = '" . (int)$order_info['order_id'] . "' AND vtd.`language_id` = '" . (int)$order_info['language_id'] . "'");

			if ($voucher_query->num_rows) {
				// Send the email in the correct language
				$this->load->model('localisation/language');

				$language_info = $this->model_localisation_language->getLanguage($order_info['language_id']);

				if ($language_info) {
					$language_code = $language_info['code'];
				} else {
					$language_code = $this->config->get('config_language');
				}

				// Load the language for any mails using a different country code and prefixing it so it does not pollute the main data pool.
				$this->language->load($language_code, 'mail', $language_code);
				$this->language->load('mail/voucher', 'mail', $language_code);

				// Add language vars to the template folder
				$results = $this->language->all();

				foreach ($results as $key => $value) {
					if (substr($key, 0, 5) == 'mail_') {
						$data[substr($key, 5)] = $value;
					}
				}

				$mail = new \Opencart\System\Library\Mail($this->config->get('config_mail_engine'));
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

				foreach ($voucher_query->rows as $voucher) {
					// HTML Mail
					$subject = html_entity_decode(sprintf($this->language->get('mail_text_subject'), $voucher['from_name']), ENT_QUOTES, 'UTF-8');

					$data['title'] = sprintf($this->language->get('mail_text_subject'), $voucher['from_name']);

					$data['text_greeting'] = sprintf($this->language->get('mail_text_greeting'), $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']));
					$data['text_from'] = sprintf($this->language->get('mail_text_from'), $voucher['from_name']);
					$data['text_redeem'] = sprintf($this->language->get('mail_text_redeem'), $voucher['code']);

					if (is_file(DIR_IMAGE . $voucher['image'])) {
						$data['image'] = $this->config->get('config_url') . 'image/' . $voucher['image'];
					} else {
						$data['image'] = '';
					}

					$data['store_name'] = $order_info['store_name'];
					$data['store_url'] = $order_info['store_url'];
					$data['message'] = nl2br($voucher['message']);

					$mail->setTo($voucher['to_email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender(html_entity_decode($order_info['store_name'], ENT_QUOTES, 'UTF-8'));
					$mail->setSubject($subject);
					$mail->setHtml($this->load->view('mail/voucher', $data));
					$mail->send();
				}
			}
		}
	}
}
