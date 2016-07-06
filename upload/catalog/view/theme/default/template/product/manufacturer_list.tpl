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
      <h1>{{ heading_title }}</h1>
      {% if categories %}
      <p><strong>{{ text_index }}</strong>
        {% for category in categories %}
        &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#{{ category.name }}">{{ category.name }}</a>
        <?php } ?>
      </p>
      {% for category in categories %}
      <h2 id="{{ category.name }}">{{ category.name }}</h2>
      {% if category.manufacturer %}
      <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
      <div class="row">
        {% for manufacturer in manufacturers %}
        <div class="col-sm-3"><a href="{{ manufacturer.href }}">{{ manufacturer.name }}</a></div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      {% else %}
      <p>{{ text_empty }}</p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="{{ continue }}" class="btn btn-primary">{{ button_continue }}</a></div>
      </div>
      <?php } ?>
      {{ content_bottom }}</div>
    {{ column_right }}</div>
</div>
{{ footer }}