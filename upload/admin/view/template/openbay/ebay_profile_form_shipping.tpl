<?php echo $header; ?><?php echo $menu; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <a data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn" onclick="$('#form').submit();"><i class="fa fa-check-circle"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn"><i class="fa fa-reply"></i></a>
      </div>
      <h1 class="panel-title"><i class="fa fa-file-text fa-lg"></i> <?php echo $text_title_list; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $btn_save; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
        <input type="hidden" name="type" value="<?php echo $type; ?>" />
        <input type="hidden" name="ebay_profile_id" value="<?php echo $ebay_profile_id; ?>" />
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          <li><a href="#tab-shipping" data-toggle="tab"><?php echo $tab_shipping; ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_profile_default; ?></label>
              <div class="col-sm-10">
                <input type="hidden" name="default" value="0" />
                <input type="checkbox" name="default" value="1" <?php if($default == 1){ echo 'checked="checked"'; } ?> />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="name"><?php echo $text_profile_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="name" value="<?php if(isset($name)){ echo $name; } ?>" placeholder="<?php echo $text_profile_name; ?>" id="name" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="description"><?php echo $text_profile_desc; ?></label>
              <div class="col-sm-10">
                <textarea name="description" class="form-control" rows="3" id="description"><?php if(isset($description)){ echo $description; } ?></textarea>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="tab-shipping">
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_postcode; ?></label>
              <div class="col-sm-10">
                <input type="text" name="data[postcode]" id="postcode" value="<?php if(isset($data['postcode'])){ echo $data['postcode']; } ?>" placeholder="<?php echo $text_shipping_postcode; ?>" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_location; ?></label>
              <div class="col-sm-10">
                <input type="text" name="data[location]" id="location" value="<?php if(isset($data['location'])){ echo $data['location']; } ?>" placeholder="<?php echo $text_shipping_location; ?>" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_dispatch_country; ?></label>
              <div class="col-sm-10">
                <select name="data[country]" class="form-control" id="country">
                  <?php foreach($setting['countries'] as $country){ ?>
                    <?php echo '<option value="'.$country['code'].'"'.(isset($data['country']) && $data['country'] == $country['code'] ? ' selected' : '').'>'.$country['name'].'</option>'; ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_despatch; ?></label>
              <div class="col-sm-10">
                <select name="data[dispatch_time]" class="form-control" id="dispatch_time">
                  <?php foreach($setting['dispatch_times'] as $dis){ ?>
                    <?php echo '<option value="'.$dis['DispatchTimeMax'].'"'.(isset($data['dispatch_time']) && $data['dispatch_time'] == $dis['DispatchTimeMax'] ? ' selected' : '').'>'.$dis['Description'].'</option>'; ?>
                  <?php } ?>
                </select>
                <span class="help-block"><?php echo $text_shipping_despatch_help; ?></span>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_getitfast; ?></label>
              <div class="col-sm-10">
                <input type="hidden" name="data[get_it_fast]" value="0" />
                <input type="checkbox" name="data[get_it_fast]" value="1" id="get_it_fast" <?php if(isset($data['get_it_fast']) && $data['get_it_fast'] == 1){ echo 'checked="checked"'; } ?> />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_type_nat; ?></label>
              <div class="col-sm-10">
                <select name="data[national][shipping_type]" class="form-control" id="shipping-type-national">
                  <?php echo $setting['shipping_types']['flat'] == 1 ? '<option value="flat"'.(isset($data['national']['shipping_type']) && $data['national']['shipping_type'] == 'flat' ? ' selected' : '').'>'.$text_shipping_flat.'</option>' : ''; ?>
                  <?php echo $setting['shipping_types']['calculated'] == 1 ? '<option value="calculated"'.(isset($data['national']['shipping_type']) && $data['national']['shipping_type'] == 'calculated' ? ' selected' : '').'>'.$text_shipping_calculated.'</option>' : ''; ?>
                  <?php echo $setting['shipping_types']['freight'] == 1 ? '<option value="freight"'.(isset($data['national']['shipping_type']) && $data['national']['shipping_type'] == 'freight' ? ' selected' : '').'>'.$text_shipping_freight.'</option>' : ''; ?>
                </select>
              </div>
            </div>

            <div id="national-container-flat" style="display:none;" class="shipping-national-container">
              <div class="form-group">
                <div class="col-sm-2">
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><label class="control-label text-right"><?php echo $text_shipping_nat; ?></label></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><a class="btn btn-primary" onclick="addShipping('national', 'flat');" id="add-national-flat"><i class="fa fa-plus-circle"></i> <?php echo $text_btn_add; ?></a></p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-12" id="options-national-flat">
                      <input type="hidden" value="<?php echo (int)$data['national']['flat']['count']; ?>" id="flat_count_national" />
                      <?php if(isset($data['national']['flat']['service_id'])) { ?>
                        <?php foreach($data['national']['flat']['service_id'] as $key => $service){ ?>
                          <div class="well" id="national_flat_<?php echo $key; ?>">
                            <div class="row form-group">
                              <div class="col-sm-1 text-right">
                                <label class="control-label"><?php echo $text_shipping_service; ?></label>
                              </div>
                              <div class="col-sm-11">
                                <select name="data[national][flat][service_id][<?php echo $key; ?>]" class="form-control">
                                  <?php foreach($data['national']['flat']['types']['service'] as $service_key => $service_type) { ?>
                                    <option value="<?php echo $service_key; ?>" <?php if ($service_key == $service) { echo ' selected'; } ?>><?php echo $service_type['description']; ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-sm-1 text-right">
                                <label class="control-label"><?php echo $text_shipping_first; ?></label>
                              </div>
                              <div class="col-sm-3">
                                <input type="text" name="data[national][flat][price][<?php echo $key; ?>]" class="form-control" value="<?php echo $data['national']['flat']['price'][$key]; ?>" />
                              </div>
                              <div class="col-sm-2 text-right">
                                <label class="control-label"><?php echo $text_shipping_add; ?></label>
                              </div>
                              <div class="col-sm-3">
                                <input type="text" name="data[national][flat][price_additional][<?php echo $key; ?>]" class="form-control" value="<?php echo $data['national']['flat']['price_additional'][$key]; ?>" />
                              </div>
                              <div class="col-sm-3 pull-right text-right">
                                <a onclick="removeShipping('national','<?php echo $key; ?>', 'flat');" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $text_btn_remove; ?></a>
                              </div>
                            </div>
                            <?php if ($cod_surcharge == 1) { ?>
                            <div class="row">
                              <div class="col-sm-2">
                                <label class="control-label"><?php echo $text_cod_surcharge; ?></label>
                              </div>
                              <div class="col-sm-10">
                                <input type="text" name="data[national][flat][cod_surcharge][<?php echo $key; ?>]" class="form-control" value="<?php echo $data['national']['flat']['cod_surcharge'][$key]; ?>" />
                              </div>
                            </div>
                            <?php } ?>
                          </div>
                        <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div id="national-container-calculated" style="display:none;" class="shipping-national-container">
              <div class="form-group">
                <div class="col-sm-2">
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><label class="control-label text-right"><?php echo $text_shipping_nat; ?></label></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><a class="btn btn-primary" onclick="addShipping('national', 'calculated');" id="add-national-calculated"><i class="fa fa-plus-circle"></i> <?php echo $text_btn_add; ?></a></p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-12" id="options-national-calculated">
                      <input type="hidden" value="<?php echo (int)$data['national']['calculated']['count']; ?>" id="calculated_count_national" />
                        <?php if(isset($data['national']['calculated']['service_id'])) { ?>
                          <?php foreach($data['national']['calculated']['service_id'] as $key => $service){ ?>
                            <div class="well" id="national_calculated_<?php echo $key; ?>">
                            <div class="row form-group">
                              <div class="col-sm-1 text-right">
                                <label class="control-label"><?php echo $text_shipping_service; ?></label>
                              </div>
                              <div class="col-sm-11">
                                <select name="data[national][calculated][service_id][<?php echo $key; ?>]" class="form-control">
                                  <?php foreach($data['national']['calculated']['types']['service'] as $service_key => $service_type) { ?>
                                    <option value="<?php echo $service_key; ?>" <?php if ($service_key == $service) { echo ' selected'; } ?>><?php echo $service_type['description']; ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-sm-2 pull-right text-right">
                                <a onclick="removeShipping('national','<?php echo $key; ?>', 'calculated');" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $text_btn_remove; ?></a>
                              </div>
                            </div>
                            <?php if ($cod_surcharge == 1) { ?>
                            <div class="row">
                              <div class="col-sm-1 text-right">
                                <label class="control-label"><?php echo $text_cod_surcharge; ?></label>
                              </div>
                              <div class="col-sm-11">
                                <input type="text" name="data[national][calculated][cod_surcharge][<?php echo $key; ?>]" class="form-control" value="<?php echo $data['national']['calculated']['cod_surcharge'][$key]; ?>" />
                              </div>
                            </div>
                            <?php } ?>
                          </div>
                          <?php } ?>
                        <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div id="national-container-freight" style="display:none;" class="shipping-national-container">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_shipping_in_desc; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" name="data[national][freight][in_description]" value="0" />
                  <input type="checkbox" name="data[national][freight][in_description]" value="1" id="shipping_in_desc" <?php if(isset($data['shipping_in_desc']) && $data['shipping_in_desc'] == 1){ echo 'checked="checked"'; } ?> />
                </div>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $text_shipping_type_int; ?></label>
              <div class="col-sm-10">
                <select name="data[international][shipping_type]" class="form-control" id="shipping-type-international">
                  <?php echo $setting['shipping_types']['flat'] == 1 ? '<option value="flat"'.(isset($data['international']['shipping_type']) && $data['international']['shipping_type'] == 'flat' ? ' selected' : '').'>'.$text_shipping_flat.'</option>' : ''; ?>
                  <?php echo $setting['shipping_types']['calculated'] == 1 ? '<option value="calculated"'.(isset($data['international']['shipping_type']) && $data['international']['shipping_type'] == 'calculated' ? ' selected' : '').'>'.$text_shipping_calculated.'</option>' : ''; ?>
                  <?php echo $setting['shipping_types']['freight'] == 1 ? '<option value="freight"'.(isset($data['international']['shipping_type']) && $data['international']['shipping_type'] == 'freight' ? ' selected' : '').'>'.$text_shipping_freight.'</option>' : ''; ?>
                </select>
              </div>
            </div>

            <div id="international-container-flat" style="display:none;" class="shipping-international-container">
              <div class="form-group">
                <div class="col-sm-2">
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><label class="control-label text-right"><?php echo $text_shipping_intnat; ?></label></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><a class="btn btn-primary" onclick="addShipping('international', 'flat');" id="add-international-flat"><i class="fa fa-plus-circle"></i> <?php echo $text_btn_add; ?></a></p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-12" id="options-international-flat">
                      <input type="hidden" value="<?php echo (int)$data['international']['flat']['count']; ?>" id="flat_count_international" />
                      <?php if(isset($data['international']['flat']['service_id'])) { ?>
                      <?php foreach($data['international']['flat']['service_id'] as $key => $service){ ?>
                          <div class="well" id="international_flat_<?php echo $key; ?>">
                            <div class="row form-group">
                              <div class="col-sm-1 text-right"><label class="control-label"><?php echo $text_shipping_service; ?></label></div>
                              <div class="col-sm-11">
                                <select name="data[national][flat][service_id][<?php echo $key; ?>]" class="form-control">
                                  <?php foreach($data['international']['flat']['types']['service'] as $service_key => $service_type) { ?>
                                  <option value="<?php echo $service_key; ?>" <?php if ($service_key == $service) { echo ' selected'; } ?>><?php echo $service_type['description']; ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>
                            <div class="row form-group">
                              <div class="col-sm-1 text-right">
                                <label class="control-label"><?php echo $text_shipping_zones; ?></label>
                              </div>
                              <div class="col-sm-10">
                                <label class="checkbox-inline">
                                  <input type="checkbox" name="data[international][flat][shipto][<?php echo $key; ?>][]" value="Worldwide" <?php echo isset($data['international']['flat']['shipto'][$key]) && in_array('Worldwide', $data['international']['flat']['shipto'][$key]) ? 'checked="checked"' : '' ?> /> <?php echo $text_shipping_worldwide; ?>
                                </label>
                                <?php foreach($zones as $zone) { ?>
                                <label class="checkbox-inline">
                                  <input type="checkbox" name="data[international][flat][shipto][<?php echo $key; ?>][]" value="<?php echo $zone['shipping_location']; ?>" <?php echo isset($data['international']['flat']['shipto'][$key]) && in_array($zone['shipping_location'], $data['international']['flat']['shipto'][$key]) ? 'checked="checked"' : ''; ?> /> <?php echo $zone['description']; ?>
                                </label>
                                <?php } ?>
                              </div>
                            </div>
                            <div class="row form-group">
                              <div class="col-sm-1 text-right">
                                <label class="control-label"><?php echo $text_shipping_first; ?></label>
                              </div>
                              <div class="col-sm-3">
                                <input type="text" name="data[international][flat][price][<?php echo $key; ?>]" class="form-control" value="<?php echo $data['international']['flat']['price'][$key]; ?>" class="form-control" />
                              </div>
                              <div class="col-sm-2 text-right">
                                <label class="control-label"><?php echo $text_shipping_add; ?></label>
                              </div>
                              <div class="col-sm-3">
                                <input type="text" name="data[international][flat][price_additional][<?php echo $key; ?>]" class="form-control" value="<?php echo $data['international']['flat']['price_additional'][$key]; ?>" />
                              </div>
                              <div class="col-sm-3 pull-right text-right">
                                <a onclick="removeShipping('international','<?php echo $key; ?>', 'flat');" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $text_btn_remove; ?></a>
                              </div>
                            </div>
                          </div>
                        <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div id="international-container-calculated" style="display:none;" class="shipping-international-container">
              <div class="form-group">
                <div class="col-sm-2">
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><label class="control-label text-right"><?php echo $text_shipping_intnat; ?></label></p>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12 text-right">
                      <p><a class="btn btn-primary" onclick="addShipping('international', 'calculated');" id="add-international-calculated"><i class="fa fa-plus-circle"></i> <?php echo $text_btn_add; ?></a></p>
                    </div>
                  </div>
                </div>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-12" id="options-international-calculated">
                      <input type="hidden" value="<?php echo (int)$data['international']['calculated']['count']; ?>" id="calculated_count_international" />
                      <?php if(isset($data['international']['calculated']['service_id'])) { ?>
                        <?php foreach($data['international']['calculated']['service_id'] as $key => $service){ ?>
                        <div class="well" id="international_calculated_<?php echo $key; ?>">
                          <div class="row form-group">
                            <div class="col-sm-1 text-right"><label class="control-label"><?php echo $text_shipping_service; ?></label></div>
                            <div class="col-sm-11">
                              <select name="data[international][calculated][service_id][<?php echo $key; ?>]" class="form-control">
                                <?php foreach($data['international']['flat']['types']['service'] as $service_key => $service_type) { ?>
                                <option value="<?php echo $service_key; ?>" <?php if ($service_key == $service) { echo ' selected'; } ?>><?php echo $service_type['description']; ?></option>
                                <?php } ?>
                              </select>
                            </div>
                          </div>
                          <div class="row form-group">
                            <div class="col-sm-1 text-right">
                              <label class="control-label"><?php echo $text_shipping_zones; ?></label>
                            </div>
                            <div class="col-sm-10">
                              <label class="checkbox-inline">
                                <input type="checkbox" name="data[international][calculated][shipto][<?php echo $key; ?>][]" value="Worldwide" <?php echo isset($data['international']['calculated']['shipto'][$key]) && in_array('Worldwide', $data['international']['calculated']['shipto'][$key]) ? 'checked="checked"' : '' ?> /> <?php echo $text_shipping_worldwide; ?>
                              </label>
                              <?php foreach($zones as $zone) { ?>
                              <label class="checkbox-inline">
                                <input type="checkbox" name="data[international][calculated][shipto][<?php echo $key; ?>][]" value="<?php echo $zone['shipping_location']; ?>" <?php echo isset($data['international']['calculated']['shipto'][$key]) && in_array($zone['shipping_location'], $data['international']['calculated']['shipto'][$key]) ? 'checked="checked"' : ''; ?> /> <?php echo $zone['description']; ?>
                              </label>
                              <?php } ?>
                            </div>
                          </div>
                          <div class="row form-group">
                            <div class="col-sm-3 pull-right text-right">
                              <a onclick="removeShipping('international','<?php echo $key; ?>', 'calculated');" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $text_btn_remove; ?></a>
                            </div>
                          </div>
                        </div>
                        <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div id="international-container-freight" style="display:none;" class="shipping-international-container">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_shipping_in_desc; ?></label>
                <div class="col-sm-10">
                  <input type="hidden" name="data[international][freight][in_description]" value="0" />
                  <input type="checkbox" name="data[international][freight][in_description]" value="1" <?php if(isset($data['shipping_in_desc']) && $data['shipping_in_desc'] == 1){ echo 'checked="checked"'; } ?> />
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  $('#shipping-type-national').bind('change', function() {
    changeNationalType();
  });

  $('#shipping-type-international').bind('change', function() {
    changeInternationalType();
  });

  function changeNationalType() {
    var shipping_type = $('#shipping-type-national').val();

    $('.shipping-national-container').hide();
    $('#national-container-'+shipping_type).fadeIn();
  }

  function changeInternationalType() {
    var shipping_type = $('#shipping-type-international').val();

    $('.shipping-international-container').hide();
    $('#international-container-'+shipping_type).fadeIn();
  }

  function addShipping(id, type) {
    if (id == 'national') {
        var loc = '0';
    } else {
        var loc = '1';
    }

    var count = $('#' + type + '_count_' + id).val();
    count = parseInt(count);

    $.ajax({
      url: 'index.php?route=openbay/ebay/getShippingService&token=<?php echo $token; ?>&loc=' + loc + '&type=' + type,
      beforeSend: function(){
        $('#add-' + id + '-' + type).empty().html('<i class="fa fa-cog fa-lg fa-spin"></i>').attr('disabled','disabled');
      },
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        html = '';
        html += '<div class="well" id="' + id + '_' + type + '_' + count + '">';
          html += '<div class="row form-group">';
            html += '<div class="col-sm-1 text-right">';
              html += '<label class="control-label"><?php echo $text_shipping_service; ?><label>';
            html += '</div>';
            html += '<div class="col-sm-11">';
              html += '<select name="data[' + id + '][' + type + '][service_id][' + count + ']" class="form-control">';
                $.each(data.service, function(key, val) {
                  html += '<option value="' + key + '">' + val.description + '</option>';
                });
              html += '</select>';
            html += '</div>';
          html += '</div>';
          if (id == 'international') {
            html += '<div class="row form-group">';
              html += '<div class="col-sm-1 text-right">';
                html += '<label class="control-label"><?php echo $text_shipping_zones; ?></label>';
              html += '</div>';
              html += '<div class="col-sm-10">';
                html += '<label class="checkbox-inline">';
                  html += '<input type="checkbox" name="data[' + id + '][' + type + '][shipto][' + count + '][]" value="Worldwide" />';
                  html += ' <?php echo $text_shipping_worldwide; ?>';
                html += '</label>';
                <?php foreach($shipping_international_zones as $zone) { ?>
                  html += '<label class="checkbox-inline">';
                    html += '<input type="checkbox" name="data[' + id + '][' + type + '][shipto][' + count + '][]" value="<?php echo $zone['shipping_location']; ?>" />';
                    html += ' <?php echo $zone['description']; ?>';
                  html += '</label>';
                <?php } ?>
              html += '</div>';
            html += '</div>';
          }
          html += '<div class="row form-group">';
            if (type != 'calculated') {
              html += '<div class="col-sm-1 text-right">';
                html += '<label class="control-label"><?php echo $text_shipping_first; ?></label>';
              html += '</div>';
              html += '<div class="col-sm-3">';
                html += '<input type="text" name="data[' + id + '][' + type + '][price][' + count + ']" class="form-control" value="0.00" class="form-control" />';
              html += '</div>';
              html += '<div class="col-sm-2 text-right">';
                html += '<label class="control-label"><?php echo $text_shipping_add; ?></label>';
              html += '</div>';
              html += '<div class="col-sm-3">';
                html += '<input type="text" name="data[' + id + '][' + type + '][price_additional][' + count + ']" class="form-control" value="0.00" />';
              html += '</div>';
            }
            html += '<div class="col-sm-3 pull-right text-right">';
              html += '<a onclick="removeShipping(\'' + id + '\',\'' + count + '\',\''+type+'\');" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $text_btn_remove; ?></a>';
            html += '</div>';
          html += '</div>';
        html += '</div>';

        $('#options-' + id + '-' + type).append(html);
        $('#add-' + id + '-' + type).empty().html('<i class="fa fa-plus-circle"></i> <?php echo $text_btn_add; ?>').removeAttr('disabled');
      },
      error: function (xhr, ajaxOptions, thrownError) {
        $('#add-shipping-'+id).empty().html('<i class="fa fa-plus-circle"></i> <?php echo $text_btn_add; ?>').removeAttr('disabled');
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });

    $('#' + type + '_count_' + id).val(count + 1);
  }

  function removeShipping(id, count, type) {
    $('#' + id + '_' + type + '_' + count).remove();
  }

  $(document).ready(function() {
    changeNationalType();
    changeInternationalType();
  });
//--></script>
<?php echo $footer; ?>