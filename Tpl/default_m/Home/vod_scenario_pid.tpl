<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="Home:block_header" />
<title>{$list_name}《{$vod_name}》First{$scenario_pid}Episode introduction -{$site_name}</title>
<meta name="keywords" content="{$vod_name}First{$scenario_pid}Set plot,{$vod_name}First{$scenario_pid}Set to watch online,{$vod_name}Synopsis">
<meta name="description" content="{$list_name}{$vod_name}First{$scenario_pid}Set plot introduction,{$vod_name}Brief introduction:{$vod_content|strip_tags|msubstr=0,100}">
</head>
<body>
<include file="Home:header" />
<div class="container vod-detail ff-bg">
<div class="row">
	<div class="col-xs-12 ff-col">
  	<div class="page-header">
      <h4><span class="glyphicon glyphicon-film ff-text"></span> <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a> <small>{$vod_name} <include file="Home:block_vod_continu" /></small></h4>
    </div>
    <ul class="list-unstyled vod-infos">
    	<li class="col-md-3 col-xs-4">
      	<img class="img-responsive img-thumbnail ff-img vod-pic" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}Complete watch">
      </li>
      <li class="col-md-9 col-xs-8">
      	<h4><a href="{:ff_url('vod/scenario', array('id'=>$vod_id,pid=>$scenario_pid), true)}" class="ff-text">{$vod_name}First{$scenario_pid}Set plot introduction</a></h4>
      	<dl class="dl-horizontal">
          <dt>Starring</dt>
          <dd class="ff-text-hidden ff-link">{$vod_actor|ff_url_search}</dd>
          <dt>Types of:</dt>
          <dd class="ff-text-hidden"><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a><include file="Home:block_vod_tags" /></dd>
          <dt>director:</dt>
          <dd class="ff-text-hidden ff-link">{$vod_director|ff_url_search='director'}</dd>
          <dt class="hidden-xs">area:</dt>
          <dd class="hidden-xs"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($vod_area),'year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_area|default='Not entered'}</a></dd>
          <dt class="hidden-xs">Details:</dt>
          <dd class="hidden-xs"><a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}</a></dd>
          <dt class="hidden-xs">years:</dt>
          <dd class="hidden-xs"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2016'}</a></dd>
          <dd class="vod_scenario_btn">
          	<a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,1,$scenario_pid)}" class="btn btn-default btn-success btn-lg">Immediately play the first{$scenario_pid}set</a>
          </dd>
        </dl>
      </li>
    </ul>
    <div class="clearfix ff-clearfix"></div>
    <notempty name="vod_scenario.info">
    <div class="clearfix ff-clearfix"></div>
    <div class="page-header">
      <h4><span class="glyphicon glyphicon-th-list ff-text"></span> {$vod_name}First{$scenario_pid}Set plot introduction</h4>
    </div> 
    <p class="lead vod-content">
    	{:ff_url_tags_content(strip_tags($vod_scenario['info'][$scenario_pid-1],'<a>'),$Tag)}
    </p>
    <div class="clearfix ff-clearfix"></div>
    <div class="page-header">
      <h4><span class="glyphicon glyphicon-th-list ff-text"></span> {$vod_name}Diverse plot introduction list</h4>
    </div>
    <div class="vod_scenario col-md-6">
    	<volist name="vod_scenario.info" id="feifei">
      <li class="vod_scenario_item">
      	<a href="{:ff_url('vod/scenario', array('id'=>$vod_id,pid=>$i), true)}" class="ff-text">{$vod_name} First{$i}set Synopsis</a>
      </li>
      </volist>
    </div>
    <div class="vod_scenario col-md-6">
    	<volist name="vod_scenario.info" id="feifei">
      <li class="vod_scenario_item">
        <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,1,$i)}" class="ff-text">{$vod_name} First{$i}set Watch online</a>
      </li>
      </volist>
    </div>
    </notempty>
  </div><!-- -->
</div>
</div>
<include file="Home:footer" />
</body>
</html>