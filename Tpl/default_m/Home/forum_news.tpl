<php>$list = ff_mysql_forum('cid:'.$forum_cid.';sid:2;pid:0;limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if($forum_cid){
	$news = $list[0];
  $page_this = ff_url('forum/news', array('cid'=>$forum_cid), true);
  $page_last = ff_url('forum/news', array('cid'=>$forum_cid,'p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/news', array('cid'=>$forum_cid,'p'=>($forum_page+1)), true);
}else{
  $page_this = ff_url('forum/news', '', true);
  $page_last = ff_url('forum/news', array('p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/news', array('p'=>($forum_page+1)), true);
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="Home:block_header" />
<title>{$news['news_name']}Commentary{$forum_page}页_{$site_name}</title>
<meta name="keywords" content="{$news['news_name']}Article wonderful comments">
<meta name="description" content="A total of film critics{$page_array.totalpages}page,For you to show the first{$forum_page}Of the wonderful comments.">
</head>
<body><include file="Home:header" />
<div class="container ff-bg ff-forum ff-forum-reload forum-vod">
<div class="row">
<div class="col-xs-10 col-xs-offset-1">
  <div class="page-header">
    <h4><span class="glyphicon glyphicon-heart-empty ff-text"></span> <a href="{$page_this}">Wonderful comments</a></h4>
  </div>
</div>
<div class="clear"></div>
<div class="ff-forum-post-{$forum_cid}" id="ff-forum-post">
<div class="col-md-10 col-md-offset-1 col-xs-12">
	<p class="text-right">
  	Article link:<a class="ff-text" href="{:ff_url_news_read($list[0]['list_id'],$list[0]['list_dir'],$list[0]['news_id'],$list[0]['news_name'],$list[0]['news_jumpurl'],1)}">{$list[0]['news_name']}</a>
  </p>
  <div>
  <form class="form-horizontal col-xs-12 ff-form form-forum" id="form-forum" role="form" action="{$root}index.php?s=forum-update" method="post">
    <input name="forum_cid" type="hidden" value="{$forum_cid}" />
    <input name="forum_sid" type="hidden" value="2" />
    <input name="forum_pid" type="hidden" value="0" />
    <div class="form-group">
      <textarea name="forum_content" class="form-control" rows="5" placeholder="Make complaints......"></textarea>
    </div>
    <div class="form-group ff-submit text-right">
      <label>
      	<input class="form-control input-sm text-center ff-vcode ff-vcode-input" name="forum_vcode" maxlength="4" type="text" placeholder="Verification code">
      </label>
      <label>
    		<button type="submit" class="btn btn-default btn-sm">Comment</button>
      </label>
    </div>
    <div class="form-group ff-alert clear">
    </div>
  </form>
  </div>
</div>
<div class="clear"></div>
</div><!--post end -->
<div id="ff-forum-item">
<volist name="list" id="feifei">
<div class="col-xs-12">
  <div class="row">
    <div class="col-xs-2 text-right">
      <img src="/Public/images/face/default.png" class="img-circle forum-face">
    </div>
    <div class="col-md-11 col-xs-10">
      <p class="forum-title">
      	《<a href="{:ff_url('forum/news', array('cid'=>$feifei['forum_cid']), true)}">{$feifei.news_name|msubstr=0,30,'utf-8',true}</a>》comment of
        <a class="btn btn-link btn-xs pull-right ff-report forum-report" id="ff-report-{$feifei.forum_id}" href="javascript:;" data-id="{$feifei.forum_id}" title="Report"><span class="glyphicon glyphicon-flag"></span> Report</a>
      </p>
      <p class="text-muted">
      	<small>
        	{$feifei.user_name|htmlspecialchars}
        	{$feifei.forum_addtime|date='Y/m/d',###}
        </small>
      </p>
      <p class="forum-content">
      	{$feifei.forum_content|htmlspecialchars|msubstr=0,500,'utf-8',true}
      </p>
      <p class="forum-btn">
        <a class="btn btn-default btn-xs ff-updown" id="ff-up-{$feifei.forum_id}" href="javascript:;" data-id="{$feifei.forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="stand by"><span class="glyphicon glyphicon-thumbs-up"></span> <span class="ff-updown-tips">{$feifei.forum_up}</span></a>
        <a class="btn btn-default btn-xs ff-updown" id="ff-down-{$feifei.forum_id}" href="javascript:;" data-id="{$feifei.forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="Against"><span class="glyphicon glyphicon-thumbs-down"></span> <span class="ff-updown-tips">{$feifei.forum_down}</span></a>
        <a class="btn btn-default btn-xs ff-reply" id="ff-reply-{$feifei.forum_id}" href="javascript:;" data-id="{$feifei.forum_id}" data-toggle="collapse" data-target="#forum-reply-{$feifei.forum_id}" title="Reply"><span class="glyphicon glyphicon-comment"></span> <span class="ff-reply-tips">{$feifei.forum_reply}</span></a>
        <a class="btn btn-default btn-xs ff-reply-read forum-reply-{$feifei.forum_reply}" href="{:ff_url('forum/detail', array('id'=>$feifei['forum_id']), true)}" target="_blank" title="View reply"><span class="glyphicon glyphicon-align-right"></span> View reply</a>
      </p>
      <p class="collapse forum-reply" id="forum-reply-{$feifei.forum_id}">
      </p>
    	<div class="col-xs-12 clear forum-clear"></div>
    </div>
  </div>
</div>
<div class="clear"></div>
</volist>
</div>
<!-- -->
<div id="ff-forum-page">
<div class="col-xs-12">
  <gt name="page_array.totalpages" value="1">
  <div class="row">
    <div class="col-xs-12 text-center">
      <ul class="pager">
        <gt name="forum_page" value="1">
          <li><a href="{$page_last}">Previous page</a></li>
        </gt>
        <lt name="forum_page" value="$page_array['totalpages']">
          <li><a href="{$page_next}">Next page</a></li>
        </lt>
      </ul> 
    </div>
  </div>
  </gt>
</div>
</div><!--pageid end -->
<!-- -->
</div><!--row end -->
</div><!-- -->
<include file="Home:footer" />
</body>
</html>