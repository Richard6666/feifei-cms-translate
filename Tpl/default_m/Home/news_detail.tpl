<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="Home:block_header" />
<title>{$news_name}<notempty name="list_title">First{$list_page}page</notempty>_{$site_name}</title>
<meta name="keywords" content="{$list_keywords}">
<meta name="description" content="{$list_description}">
</head>
<include file="Home:header" />
<div class="container ff-bg ff-news news-detail">
<div class="row">
	<div class="col-xs-12 ff-col">
  	<div class="page-header">
      <h3 class="text-center">
      	{$news_name}
      </h3>
      <h5 class="text-muted text-center visible-md visible-lg">
      	source:{$news_inputer|default='Anonymous'}
        Popularity:{$news_hits}
        Update:{$news_addtime|date='Y-m-d H:i:s',###}
      </h5>         
    </div>
    <p class="lead">
    	{$news_remark}
    </p> 
    <div class="content">
    	{:ff_url_tags_content($news_content, $Tag)}
    </div> 
    <p class="text-center">
      <a class="btn btn-default btn-lg ff-updown" href="javascript:;" data-id="{$news_id}" data-module="news" data-type="up" data-toggle="tooltip" data-placement="top" title="有用">
        <span class="glyphicon glyphicon-thumbs-up"></span> it works(<span class="ff-updown-tips">{$news_up}</span>）
      </a>
  	</p>
    <include file="Home:block_news_page" />
  	<include file="Home:block_news_nextprev" />
    <include file="Home:block_news_tags" />
    <div class="clearfix ff-clearfix"></div>
    <div class="page-header">
      <h4>
      	<small class="pull-right"><a class="text-muted" href="{:ff_url('forum/news', array('cid'=>$news_id), true)}" target="_blank">View all comments</a></small>
      	<span class="glyphicon glyphicon-th-list ff-text"></span> Comment
      </h4>
    </div>
    <div class="ff-forum" id="ff-forum" data-id="{$news_id}" data-sid="{$site_sid}">
      Comment loading...
    </div>
  </div>
  <div class="col-xs-12 ff-col">
    <div class="page-header ff-border-none">
      <h4><span class="glyphicon glyphicon-signal ff-text"></span> Popular{$list_name}</h4>
    </div>
    <ol class="news-item-hot">
    <volist name=":ff_mysql_news('cid:'.$list_id.';limit:10;cache_name:default;cache_time:default;order:news_hits;sort:desc')" id="feifei"><li><a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}">{$feifei.news_name}</a></li></volist>
    </ol>
  </div>
</div>
</div>
{$news_hits_insert}
<include file="Home:footer" />
</body>
</html>