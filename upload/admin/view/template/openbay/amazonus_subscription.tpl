<?php echo $header; ?><?php echo $menu; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <a href="<?php echo $link_overview; ?>" data-toggle="tooltip" title="<?php echo $text_btn_return; ?>" class="btn"><i class="fa fa-reply"></i></a>
      </div>
      <h1 class="panel-title"><i class="fa fa-user fa-lg"></i> <?php echo $text_title; ?></h1>
    </div>
    <div class="panel-body">
      <?php if (!$user_plan) { ?>
      <div>
        <h2><?php echo $text_register ?></h2>
        <p><?php echo $text_register_invite ?></p>
        <p><a href="<?php echo $server ?>account/register/" class="btn btn-primary" target="_blank"><?php echo $text_register ?></a></p>
      </div>
      <?php } else { ?>
      <div class="row">
        <div class="col-md-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h1 class="panel-title"><i class="fa fa-user fa-lg"></i> <?php echo $text_current_plan; ?></h1>
            </div>
            <div class="panel-body">
              <table class="table">
                <tbody>
                <tr>
                  <td class="text-right"><b><?php echo $text_merchantid;?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['merchant_id'] ?> [ <a href="<?php echo $link_change_seller; ?>" target="_blank"><?php echo $text_change_merchantid; ?></a> ]</td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_account_status;?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['user_status'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_name ?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['title'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_description ?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['description'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_order_frequency ?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['order_frequency'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_product_listings ?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['product_listings'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_listings_remaining ?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['listings_remain'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_listings_reserved ?>:</b></td>
                  <td class="text-left"><?php echo $user_plan['listings_reserved'] ?></td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_bulk_listing ?>:</b></td>
                  <td class="text-left">
                    <?php if ($user_plan['bulk_listing']) { ?>
                    <?php echo $text_allowed ?>
                    <?php } else { ?>
                    <?php echo $text_not_allowed ?>
                    <?php } ?>
                  </td>
                </tr>
                <tr>
                  <td class="text-right"><b><?php echo $text_price; ?>:</b></td>
                  <td class="text-left">&pound;<?php echo $user_plan['price'] ?></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h1 class="panel-title"><i class="fa fa-list fa-lg"></i> <?php echo $text_available_plans; ?></h1>
            </div>
            <div class="panel-body">
              <table class="table">
                <thead>
                <tr>
                  <td class="text-right"><?php echo $text_name; ?></td>
                  <td class="text-left"><?php echo $text_description; ?></td>
                  <td class="text-left"><?php echo $text_order_frequency; ?></td>
                  <td class="text-left"><?php echo $text_product_listings; ?></td>
                  <td class="text-left"><?php echo $text_bulk_listing; ?></td>
                  <td class="text-left"><?php echo $text_price; ?></td>
                </tr>
                </thead>

                <tbody>
                <?php foreach ($plans as $plan) { ?>
                <tr>
                  <td class="text-right"><?php echo $plan['title']; ?></td>
                  <td class="text-left"><?php echo $plan['description']; ?></td>
                  <td class="text-left"><?php echo $plan['order_frequency']; ?></td>
                  <td class="text-left"><?php echo $plan['product_listings']; ?></td>
                  <td class="text-left">
                    <?php if ($plan['bulk_listing']) { ?>
                    <?php echo $text_allowed; ?>
                    <?php } else { ?>
                    <?php echo $text_not_allowed; ?>
                    <?php } ?>
                  </td>
                  <td class="text-left">&pound;<?php echo $plan['price'] ?></td>
                </tr>
                <?php } ?>
                </tbody>
              </table>
              <?php if ($token) { ?>
              <div class="pull-right">
                <a href="<?php echo $link_change_plan; ?>" class="btn btn-primary" target="_blank"><i class="fa fa-arrow-right fa-lg"></i> <?php echo $button_change_plan; ?></a>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>