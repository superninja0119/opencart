<?php echo $header; ?><?php echo $menu; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <a data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn" id="btn-cancel"><i class="fa fa-reply"></i></a>
      </div>
      <h1 class="panel-title"><i class="fa fa-pencil-square fa-lg"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body" id="page-listing">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
        <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>"/>
        <input type="hidden" name="quantity" value="<?php echo $product['quantity']; ?>"/>

        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-listing-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          <li><a href="#tab-listing-additional" data-toggle="tab"><?php echo $tab_additional; ?></a></li>
          <li><a href="#tab-listing-images" data-toggle="tab"><?php echo $tab_images; ?></a></li>
        </ul>
        <div class="tab-content">
          <div id="tab-listing-general" class="tab-pane active">
            <div class="well">
              <div class="row">
                <div class="col-sm-12">

                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?> <span id="category-loading" style="display: none;"><i class="fa fa-cog fa-lg fa-spin"></i></span></label>
                    <div class="col-sm-10">
                      <div class="alert alert-success" id="category-selected" style="display:none;"><i class="fa fa-check fa-lg" style="color:green"></i> <?php echo $text_category_selected; ?></div>
                      <select name="top_category" id="input-category" class="form-control">
                        <option id="category-default"><?php echo $text_option; ?></option>
                        <?php foreach ($setting['top_categories'] as $value) { ?>
                        <option value="<?php echo $value['category_name']; ?>"><?php echo $value['long_name']; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group" style="display:none;" id="container-sub-category">
                    <label class="col-sm-2 control-label" for="input-sub-category"><span id="sub-category-loading" style="display: none;"><i class="fa fa-cog fa-lg fa-spin"></i></span></label>
                    <div class="col-sm-10">
                      <select name="top_category" id="input-sub-category" class="form-control"></select>
                    </div>
                  </div>
                  <div class="form-group" style="display:none;" id="container-sub-sub-category">
                    <label class="col-sm-2 control-label" for="input-sub-sub-category"><span id="sub-sub-category-loading" style="display: none;"><i class="fa fa-cog fa-lg fa-spin"></i></span></label>
                    <div class="col-sm-10">
                      <select name="top_category" id="input-sub-sub-category" class="form-control"></select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
              <div class="col-sm-10">
                <input type="text" name="title" value="<?php echo $product['name']; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
              <div class="col-sm-10">
                <textarea name="description" placeholder="<?php echo $entry_description; ?>" id="input-description" class="form-control"></textarea>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
              <div class="col-sm-10">
                <input type="text" name="price" value="<?php echo $product['price']; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-is-supply"><?php echo $entry_is_supply; ?></label>
              <div class="col-sm-10">
                <select name="is_supply" id="input-is-supply" class="form-control">
                  <option value="false" selected="selected">No</option>
                  <option value="true">Yes</option>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-who-made"><?php echo $entry_who_made; ?></label>
              <div class="col-sm-10">
                <select name="who_made" id="input-who-made" class="form-control">
                  <?php foreach ($setting['who_made'] as $value) { ?>
                  <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-when-made"><?php echo $entry_when_made; ?></label>
              <div class="col-sm-10">
                <select name="when_made" id="input-when-made" class="form-control">
                  <?php foreach ($setting['when_made'] as $value) { ?>
                  <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-state"><?php echo $entry_state; ?></label>
              <div class="col-sm-10">
                <select name="state" id="input-state" class="form-control">
                  <?php foreach ($setting['state'] as $value) { ?>
                  <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-shipping"><?php echo $entry_shipping; ?> <span id="shipping-loading" style="display: none;"><i class="fa fa-cog fa-lg fa-spin"></i></span></label>
              <div class="col-sm-10">
                <select name="shipping_template_id" id="input-shipping" class="form-control" disabled="disabled"></select>
              </div>
            </div>
          </div>
          <div id="tab-listing-additional" class="tab-pane">
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-shop-section"><?php echo $entry_shop; ?> <span id="shop-section-loading" style="display: none;"><i class="fa fa-cog fa-lg fa-spin"></i></span></label>
              <div class="col-sm-10">
                <select name="shop_section_id" id="input-shop-section" class="form-control" disabled="disabled"></select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-style-1"><?php echo $entry_style; ?></label>
              <div class="col-sm-10">
                <input type="text" name="style_1" value="" placeholder="<?php echo $entry_style; ?>" id="input-style-1" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-style-2"><?php echo $entry_style_2; ?></label>
              <div class="col-sm-10">
                <input type="text" name="style_2" value="" placeholder="<?php echo $entry_style_2; ?>" id="input-style-2" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-non-taxable"><?php echo $entry_non_taxable; ?></label>
              <div class="col-sm-10">
                <select name="non_taxable" id="input-non-taxable" class="form-control">
                  <option value="0" selected="selected">No</option>
                  <option value="1">Yes</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-recipient"><?php echo $entry_recipient; ?></label>
              <div class="col-sm-10">
                <select name="recipient" id="input-recipient" class="form-control">
                  <?php foreach ($setting['recipient'] as $value) { ?>
                  <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-occasion"><?php echo $entry_occasion; ?></label>
              <div class="col-sm-10">
                <select name="occasion" id="input-occasion" class="form-control">
                  <?php foreach ($setting['occasion'] as $value) { ?>
                  <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-is-custom"><?php echo $entry_is_custom; ?></label>
              <div class="col-sm-10">
                <select name="is_customizable" id="input-is-custom" class="form-control">
                  <option value="0" selected="selected">No</option>
                  <option value="1">Yes</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-processing-min"><?php echo $entry_processing_min; ?></label>
              <div class="col-sm-10">
                <input type="text" name="processing_min" value="" placeholder="<?php echo $entry_processing_min; ?>" id="input-processing-min" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-processing-max"><?php echo $entry_processing_max; ?></label>
              <div class="col-sm-10">
                <input type="text" name="processing_max" value="" placeholder="<?php echo $entry_processing_max; ?>" id="input-processing-max" class="form-control" />
              </div>
            </div>
            <input type="hidden" name="category_id" value="" id="category-id" />
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-material"><?php echo $entry_materials; ?></label>
              <div class="col-sm-10">
                <div class="row">
                  <div class="col-sm-4">
                    <div class="row">
                      <div class="col-xs-8">
                        <input type="text" name="material_input" value="" placeholder="<?php echo $entry_materials; ?>" id="input-material" class="form-control" />
                      </div>
                      <div class="col-xs-2">
                        <button class="btn btn-primary" title="" onclick="addMaterial();" data-toggle="tooltip" type="button" data-original-title="<?php echo $text_material_add; ?>"><i class="fa fa-plus-circle"></i></button>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-8">
                    <ul class="list-group" id="material-container"></ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div id="tab-listing-images" class="tab-pane">

          </div>
          <div class="well">
            <div class="row">
              <div class="col-sm-12 text-right">
                <a class="btn btn-primary" id="button-submit" onclick="submitForm();"><span><?php echo $btn_submit; ?></span></a>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  function submitForm() {
    $.ajax({
      url: 'index.php?route=openbay/etsy_product/createSubmit&token=<?php echo $token; ?>',
      beforeSend: function(){
        $('#button-submit').empty().html('<i class="fa fa-cog fa-lg fa-spin"></i>').attr('disabled','disabled');
      },
      type: 'post',
      data: $("#form").serialize(),
      dataType: 'json',
      success: function(json) {
        $('#button-submit').empty().html('<span><?php echo $btn_submit; ?></span>').removeAttr('disabled');

        if (json.error) {
          $.each(json.error, function( k, v ) {
            alert(v);
          });
        } else {

        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
        $('#button-submit').empty().html('<span><?php echo $btn_submit; ?></span>').removeAttr('disabled');
      }
    });
  }

  var material_count = 0;

  function addMaterial() {
    var material = $('#input-material').val();

    if (material != '') {
      $('#material-container').append('<input type="hidden" name="material[]" value="'+material+'" /><li class="list-group-item" id="material-id-'+material_count+'"><div class="row"><div class="col-xs-1"><button class="btn btn-danger btn-xs" title="" type="button" data-toggle="tooltip" data-original-title="<?php echo $text_material_remove; ?>" onclick="$(\'#material-id-'+material_count+'\').remove();"><i class="fa fa-times"></i></button></div><div class="col-xs-11">'+material+'</div></div></li>');

      material_count = material_count + 1;

      $('#input-material').val('');
    }
  }

$('#input-category').on('change', function() {
  $.ajax({
    url: 'index.php?route=openbay/etsy_product/getSubCategory&token=<?php echo $token; ?>',
    beforeSend: function(){
      $('#input-category').attr('disabled','disabled');
      $('#input-sub-category').empty();
      $('#input-sub-sub-category').empty();
      $('#container-sub-category').hide();
      $('#container-sub-sub-category').hide();
      $('#category-id').val('');
      $('#category-loading').show();
      $('#category-selected').hide();
      $('#category-sub-default').remove();
    },
    type: 'post',
    data: {'tag' : $(this).val()},
    dataType: 'json',
    success: function(json) {
      $('#input-sub-category').append('<option id="category-sub-default" selected="selected"><?php echo $text_option; ?></option>');
      $.each(json.data, function( k, v ) {
        $('#input-sub-category').append('<option value="'+v.category_name+'">'+ v.long_name+'</option>');
      });

      $('#input-category').removeAttr('disabled');
      $('#container-sub-category').show();
      $('#category-loading').hide();
    },
    error: function (xhr, ajaxOptions, thrownError) {
      if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
      $('#input-category').removeAttr('disabled');
    }
  });
});

$('#input-sub-category').on('change', function() {
  var sub_tag = $(this).val();

  $.ajax({
    url: 'index.php?route=openbay/etsy_product/getSubSubCategory&token=<?php echo $token; ?>',
    beforeSend: function(){
      $('#input-category').attr('disabled','disabled');
      $('#input-sub-category').attr('disabled','disabled');
      $('#input-sub-sub-category').empty();
      $('#container-sub-sub-category').hide();
      $('#category-id').val('');
      $('#sub-category-loading').show();
      $('#category-selected').hide();
      $('#category-sub-default').remove();
    },
    type: 'post',
    data: {'sub_tag' : sub_tag},
    dataType: 'json',
    success: function(json) {
      if ($.isEmptyObject(json.data)) {
        var category;

        category = getCategory(sub_tag);
      } else {
        $('#input-sub-sub-category').append('<option id="category-sub-sub-default" selected="selected"><?php echo $text_option; ?></option>');
        $.each(json.data, function( k, v ) {
          $('#input-sub-sub-category').append('<option value="'+v.category_name+'">'+ v.long_name+'</option>');
        });

        $('#container-sub-sub-category').show();
      }

      $('#input-category').removeAttr('disabled');
      $('#input-sub-category').removeAttr('disabled');
      $('#sub-category-loading').hide();
    },
    error: function (xhr, ajaxOptions, thrownError) {
      if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
      $('#input-category').removeAttr('disabled');
      $('#input-sub-category').removeAttr('disabled');
    }
  });
});

$('#input-sub-sub-category').on('change', function() {
  $('#category-sub-sub-default').remove();
  getCategory($(this).val());
});

function getCategory(tag) {
  $.ajax({
    url: 'index.php?route=openbay/etsy_product/getCategory&token=<?php echo $token; ?>',
    beforeSend: function(){ },
    type: 'post',
    data: {'tag' : tag},
    dataType: 'json',
    success: function(json) {
      setCategory(json.data.category_id);
    },
    error: function (xhr, ajaxOptions, thrownError) {
      if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
    }
  });
}

function setCategory(id) {
  $('#category-id').val(id);
  $('#category-selected').show();
}

function getShippingProfiles() {
  $.ajax({
    url: 'index.php?route=openbay/etsy_shipping/getAll&token=<?php echo $token; ?>',
    beforeSend: function(){
      $('#shipping-loading').show();
    },
    type: 'get',
    dataType: 'json',
    success: function(json) {
      if ($.isEmptyObject(json.data.results)) {
        alert('<?php echo $error_no_shipping; ?>');
      } else {
        $.each(json.data.results, function( k, v ) {
          $('#input-shipping').append('<option value="'+v.shipping_template_id+'">'+ v.title+'</option>');
        });
      }

      $('#input-shipping').removeAttr('disabled');
      $('#shipping-loading').hide();
    },
    error: function (xhr, ajaxOptions, thrownError) {
      if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
    }
  });
}

function getShopSection() {
  $.ajax({
    url: 'index.php?route=openbay/etsy_shop/getSections&token=<?php echo $token; ?>',
    beforeSend: function(){
      $('#shop-section-loading').show();
    },
    type: 'get',
    dataType: 'json',
    success: function(json) {
      if ($.isEmptyObject(json.data.results)) {
        alert('<?php echo $error_no_shop_secton; ?>');
      } else {
        $.each(json.data.results, function( k, v ) {
          $('#input-shop-section').append('<option value="'+v.shop_section_id+'">'+ v.title+'</option>');
        });
      }

      $('#input-shop-section').removeAttr('disabled');
      $('#shop-section-loading').hide();
    },
    error: function (xhr, ajaxOptions, thrownError) {
      if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
    }
  });
}

$(document).ready(function() {
  getShippingProfiles();
  getShopSection();
});

//--></script>
<?php echo $footer; ?>