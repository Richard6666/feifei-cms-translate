<php>
$list = ff_mysql_special('limit:24;tag_name:'.$special_type.';tag_list:special_type;page_is:true;page_id:special;page_p:'.$special_page.';cache_name:default;cache_time:default;order:special_stars;sort:desc');
$page = ff_url_page('special/show',array('type'=>urlencode($special_type),'p'=>'FFLINK'),true,'special',4);
$totalpages = ff_page_count('special', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="Home:block_header" />
<title>Film and television topics first{$special_page}page_{$site_name}</title>
<meta name="keywords" content="{$list_keywords}">
<meta name="description" content="{$list_description}">
</head>
<body>
<include file="Home:header" />
<div class="container ff-bg ff-special special-list">
<div class="row">
	<div class="col-xs-12 ff-col">
  	<div class="page-header">
      <h4>
        <span class="ff-text">Film and television topics</span>
        <small>Altogether<span class="ff-text">{:ff_page_count('special', 'records')}</span>A topic</small>
      </h4>
    </div>
  </div>
  <!-- -->
  <ul class="list-unstyled">
    <volist name="list" id="feifei">
    <li class="col-xs-6 col-md-3">
      <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" class="thumbnail">
        <img src="{:ff_url_img($feifei['special_logo'])}" alt="{$feifei.special_name}" class="img-responsive">
      </a>
      <h3 class="text-center ff-text-hidden">
        <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" title="{$feifei.special_name}">{$feifei.special_name|msubstr=0,8}</a>
      </h3>
    </li>
    </volist>
  </ul>
  <!-- -->
  <gt name="totalpages" value="1">
    <div class="clearfix ff-clearfix"></div>
    <div class="text-center">
      <ul class="pagination pagination-lg hidden-xs">
        {$page}
      </ul>
    </div>
  </gt>
</div>
</div>
<include file="Home:footer" />
</body>
</html>