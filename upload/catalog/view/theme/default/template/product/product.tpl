{{ header }}
<div class="container">
  <ul class="breadcrumb">
    {% for breadcrumb in breadcrumbs %}
    <li><a href="{{ breadcrumb.href }}">{{ breadcrumb.text }}</a></li>
    {% endfor %}
  </ul>
  <div class="row">{{ column_left }}
    {% if column_left and column_right %}
    {% set class = 'col-sm-6' %}
    {% elseif column_left or column_right %}
    {% set class = 'col-sm-9' %}
    {% else %}
    {% set class = 'col-sm-12' %}
    <?php } ?>
    <div id="content" class="{{ class }}">{{ content_top }}
      <div class="row">
        {% if column_left || $column_right %}
        {% set class = 'col-sm-6' %}
        {% else %}
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="{{ class }}">
          {% if thumb || $images %}
          <ul class="thumbnails">
            {% if thumb %}
            <li><a class="thumbnail" href="{{ popup }}" title="{{ heading_title }}"><img src="{{ thumb }}" title="{{ heading_title }}" alt="{{ heading_title }}" /></a></li>
            <?php } ?>
            {% if images %}
            {% for image in images %}
            <li class="image-additional"><a class="thumbnail" href="{{ image.popup }}" title="{{ heading_title }}"> <img src="{{ image.thumb }}" title="{{ heading_title }}" alt="{{ heading_title }}" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab">{{ tab_description }}</a></li>
            {% if attribute_groups %}
            <li><a href="#tab-specification" data-toggle="tab">{{ tab_attribute }}</a></li>
            <?php } ?>
            {% if review_status %}
            <li><a href="#tab-review" data-toggle="tab">{{ tab_review }}</a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description">{{ description }}</div>
            {% if attribute_groups %}
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                {% for attribute_group in attribute_groups %}
                <thead>
                  <tr>
                    <td colspan="2"><strong>{{ attribute_group.name }}</strong></td>
                  </tr>
                </thead>
                <tbody>
                  {% for attribute in attribute_group.attribute %}
                  <tr>
                    <td>{{ attribute.name }}</td>
                    <td>{{ attribute.text }}</td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            {% if review_status %}
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2>{{ text_write }}</h2>
                {% if review_guest %}
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name">{{ entry_name }}</label>
                    <input type="text" name="name" value="{{ customer_name }}" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review">{{ entry_review }}</label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block">{{ text_note }}</div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label">{{ entry_rating }}</label>
                    &nbsp;&nbsp;&nbsp; {{ entry_bad }}&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;{{ entry_good }}</div>
                </div>
                {{ captcha }}
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="{{ text_loading }}" class="btn btn-primary">{{ button_continue }}</button>
                  </div>
                </div>
                {% else %}
                {{ text_login }}
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        {% if column_left || $column_right %}
        {% set class = 'col-sm-6' %}
        {% else %}
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="{{ class }}">
          <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="{{ button_wishlist }}" onclick="wishlist.add('{{ product_id }}');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="{{ button_compare }}" onclick="compare.add('{{ product_id }}');"><i class="fa fa-exchange"></i></button>
          </div>
          <h1>{{ heading_title }}</h1>
          <ul class="list-unstyled">
            {% if manufacturer %}
            <li>{{ text_manufacturer }} <a href="{{ manufacturers }}">{{ manufacturer }}</a></li>
            <?php } ?>
            <li>{{ text_model }} {{ model }}</li>
            {% if reward %}
            <li>{{ text_reward }} {{ reward }}</li>
            <?php } ?>
            <li>{{ text_stock }} {{ stock }}</li>
          </ul>
          {% if price %}
          <ul class="list-unstyled">
            {% if !$special %}
            <li>
              <h2>{{ price }}</h2>
            </li>
            {% else %}
            <li><span style="text-decoration: line-through;">{{ price }}</span></li>
            <li>
              <h2>{{ special }}</h2>
            </li>
            <?php } ?>
            {% if tax %}
            <li>{{ text_tax }} {{ tax }}</li>
            <?php } ?>
            {% if points %}
            <li>{{ text_points }} {{ points }}</li>
            <?php } ?>
            {% if discounts %}
            <li>
              <hr>
            </li>
            {% for discount in discounts %}
            <li>{{ discount.quantity }}{{ text_discount }}{{ discount.price }}</li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <div id="product">
            {% if options %}
            <hr>
            <h3>{{ text_option }}</h3>
            {% for option in options %}
            {% if option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option{{ option.product_option_id }}">{{ option.name }}</label>
              <select name="option[{{ option.product_option_id }}]" id="input-option{{ option.product_option_id }}" class="form-control">
                <option value="">{{ text_select }}</option>
                {% for option_value in option.product_option_value %}
                <option value="{{ option_value.product_option_value_id }}">{{ option_value.name }}
                {% if option_value.price %}
                ({{ option_value.price_prefix }}{{ option_value.price }})
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            {% if option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label">{{ option.name }}</label>
              <div id="input-option{{ option.product_option_id }}">
                {% for option_value in option.product_option_value %}
                <div class="radio">
                  <label>
                    <input type="radio" name="option[{{ option.product_option_id }}]" value="{{ option_value.product_option_value_id }}" />
                    {% if option_value.image %}
                    <img src="{{ option_value.image }}" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    {{ option_value.name }}
                    {% if option_value.price %}
                    ({{ option_value.price_prefix }}{{ option_value.price }})
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            {% if option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label">{{ option.name }}</label>
              <div id="input-option{{ option.product_option_id }}">
                {% for option_value in option.product_option_value %}
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[{{ option.product_option_id }}][]" value="{{ option_value.product_option_value_id }}" />
                    {% if option_value.image %}
                    <img src="{{ option_value.image }}" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    {{ option_value.name }}
                    {% if option_value.price %}
                    ({{ option_value.price_prefix }}{{ option_value.price }})
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            {% if option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option{{ option.product_option_id }}">{{ option.name }}</label>
              <input type="text" name="option[{{ option.product_option_id }}]" value="{{ option.value }}" placeholder="{{ option.name }}" id="input-option{{ option.product_option_id }}" class="form-control" />
            </div>
            <?php } ?>
            {% if option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option{{ option.product_option_id }}">{{ option.name }}</label>
              <textarea name="option[{{ option.product_option_id }}]" rows="5" placeholder="{{ option.name }}" id="input-option{{ option.product_option_id }}" class="form-control">{{ option.value }}</textarea>
            </div>
            <?php } ?>
            {% if option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label">{{ option.name }}</label>
              <button type="button" id="button-upload{{ option.product_option_id }}" data-loading-text="{{ text_loading }}" class="btn btn-default btn-block"><i class="fa fa-upload"></i> {{ button_upload }}</button>
              <input type="hidden" name="option[{{ option.product_option_id }}]" value="" id="input-option{{ option.product_option_id }}" />
            </div>
            <?php } ?>
            {% if option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option{{ option.product_option_id }}">{{ option.name }}</label>
              <div class="input-group date">
                <input type="text" name="option[{{ option.product_option_id }}]" value="{{ option.value }}" data-date-format="YYYY-MM-DD" id="input-option{{ option.product_option_id }}" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            {% if option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option{{ option.product_option_id }}">{{ option.name }}</label>
              <div class="input-group datetime">
                <input type="text" name="option[{{ option.product_option_id }}]" value="{{ option.value }}" data-date-format="YYYY-MM-DD HH:mm" id="input-option{{ option.product_option_id }}" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            {% if option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option{{ option.product_option_id }}">{{ option.name }}</label>
              <div class="input-group time">
                <input type="text" name="option[{{ option.product_option_id }}]" value="{{ option.value }}" data-date-format="HH:mm" id="input-option{{ option.product_option_id }}" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            {% if recurrings %}
            <hr>
            <h3>{{ text_payment_recurring }}</h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value="">{{ text_select }}</option>
                {% for recurring in recurrings %}
                <option value="{{ recurring.recurring_id }}">{{ recurring.name }}</option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
              <label class="control-label" for="input-quantity">{{ entry_qty }}</label>
              <input type="text" name="quantity" value="{{ minimum }}" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="{{ product_id }}" />
              <br />
              <button type="button" id="button-cart" data-loading-text="{{ text_loading }}" class="btn btn-primary btn-lg btn-block">{{ button_cart }}</button>
            </div>
            {% if minimum > 1 %}
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> {{ text_minimum }}</div>
            <?php } ?>
          </div>
          {% if review_status %}
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              {% if rating < $i %}
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              {% else %}
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">{{ reviews }}</a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">{{ text_write }}</a></p>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style" data-url="{{ share }}"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      {% if products %}
      <h3>{{ text_related }}</h3>
      <div class="row">
        <?php $i = 0; ?>
        {% for product in products %}
        {% if column_left and column_right %}
        <?php $class = 'col-xs-8 col-sm-6'; ?>
        {% elseif column_left or column_right %}
        <?php $class = 'col-xs-6 col-md-4'; ?>
        {% else %}
        <?php $class = 'col-xs-6 col-sm-3'; ?>
        <?php } ?>
        <div class="{{ class }}">
          <div class="product-thumb transition">
            <div class="image"><a href="{{ product.href }}"><img src="{{ product.thumb }}" alt="{{ product.name }}" title="{{ product.name }}" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="{{ product.href }}">{{ product.name }}</a></h4>
              <p>{{ product.description }}</p>
              {% if product.rating %}
              <div class="rating">
                <?php for ($j = 1; $j <= 5; $j++) { ?>
                {% if product['rating'] < $j %}
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                {% else %}
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              {% if product.price %}
              <p class="price">
                {% if !$product.special %}
                {{ product.price }}
                {% else %}
                <span class="price-new">{{ product.special }}</span> <span class="price-old">{{ product.price }}</span>
                <?php } ?>
                {% if product.tax %}
                <span class="price-tax">{{ text_tax }} {{ product.tax }}</span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('{{ product.product_id }}', '{{ product.minimum }}');"><span class="hidden-xs hidden-sm hidden-md">{{ button_cart }}</span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="{{ button_wishlist }}" onclick="wishlist.add('{{ product.product_id }}');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="{{ button_compare }}" onclick="compare.add('{{ product.product_id }}');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        {% if ($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0 %}
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      {% if tags %}
      <p>{{ text_tags }}
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        {% if i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        {% else %}
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      {{ content_bottom }}</div>
    {{ column_right }}</div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id={{ product_id }}');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id={{ product_id }}',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
{{ footer }}
