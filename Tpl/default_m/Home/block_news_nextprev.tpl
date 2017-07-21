<php>
$detail_prev = ff_detail_array('news', 'prev', $news_id, $news_cid);
$detail_next = ff_detail_array('news', 'next', $news_id, $news_cid);
</php>           
<ul>
<empty name="detail_prev">
	<li>Previous: No</li>
<else/>
	<li>Previous:<a href="{:ff_url_news_read($list_id,$list_dir,$detail_prev['news_id'],$detail_prev['news_ename'],$detail_prev['news_jumpurl'],1)}">{$detail_prev.news_name}</a></li>
</empty>
<empty name="detail_next">
	<li>Next: No</li>
<else/>
	<li>Next:<a href="{:ff_url_news_read($list_id,$list_dir,$detail_next['news_id'],$detail_next['news_ename'],$detail_next['news_jumpurl'],1)}">{$detail_next.news_name}</a></li>
</empty>
</ul>