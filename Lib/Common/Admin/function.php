<?php
//生成对应的路由规则及路由反向URL规则
function ff_url_create($rewrite_route){
	$rewrite_route = htmlspecialchars($rewrite_route);
	$array_rule = explode("\r\n",$rewrite_route);
	$create = array();
	foreach($array_rule as $key=>$value){
		$array = explode('===', $value);
		$routes = ff_url_routes($array[0], $array[1]);//每一行的路由规则
		$action = str_replace(',','/',$routes[1].'/'.$routes[2]);//每一行的路由对应的反向model-action
		//
		$create['route_rules'][$key] = $routes;
		$create['rewrite_rules'][$action]['find'] = str_replace(array('(:num)','(:any)'), array('(\d+)','(.*)'), $array[0]);
		$create['rewrite_rules'][$action]['replace'] = ff_url_replace($array[1]);
	}
	return $create;
}
// 三个===隔开的地址格式生成对应的路由反向链接替换规则
function ff_url_replace($url_rule){
	preg_match_all('/\(:num\)|\(:any\)/', $url_rule, $array);
	foreach($array[0] as $key=>$value){
		$value = preg_quote($value);
		$url_rule = preg_replace('/'.$value.'/','\$'.($key+1), $url_rule, 1);
	}
	return $url_rule;
}
// 三个===隔开的地址格式生成对应的路由定义规则 preg_quote($value);
function ff_url_routes($action, $routes){
	//news-read-id-(\d+)-p-(\d+).html===news/(\d+)-(\d+).html
	$array = explode('-', $action);
	$count = count($array);
	for ($i=1; $i<$count; ++$i){
		if(isset($array[++$i])){
			$ids[] = $array[$i];
		}
	}
	$routes = str_replace('/','\/',$routes);//TP路由需要将/转义
	$routes = str_replace(array('(:num)','(:any)'), array('(\d+)','(.*)'), $routes);//转化为正则规则
	return array( '/'.$routes.'/', $array[0].'/'.$array[1], implode(',',$ids) );
}
//星级转化数组
function admin_star_arr($stars){
	for ($i=1; $i<=5; $i++) {
		if ($i <= $stars){
			$ss[$i]=1;
		}else{
			$ss[$i]=0;
		}
	}
	return $ss;
}
// 获取模板分页数据大小
function gettplnum($rule,$filename){
	$content = read_file(TMPL_PATH.C('default_theme').'/Home/'.trim($filename).'.tpl');
	preg_match_all('/'.$rule.'/', $content, $data);
	foreach($data[1] as $key=>$val){
		if(strpos($val,'page:true')>0){
			$array = explode(';',str_replace('num','limit',$val));
			foreach ($array as $v){list($key,$val) = explode(':',trim($v));$param[trim($key)]=trim($val);}
			return $param['limit'];break;
		}
	}
	return 0;
}
// 安装测试写入文件
function testwrite($d){
	$tfile = '_feifeicms.txt';
	$d = ereg_replace('/$','',$d);
	$fp = @fopen($d.'/'.$tfile,'w');
	if(!$fp){
		return false;
	}else{
		fclose($fp);
		$rs = @unlink($d.'/'.$tfile);
		if($rs){
			return true;
		}else{
			return false;
		}
	}
}
// 获取文件夹大小
function getdirsize($dir){ 
	$dirlist = opendir($dir);
	while (false !==  ($folderorfile = readdir($dirlist))){ 
		if($folderorfile != "." && $folderorfile != "..") { 
			if (is_dir("$dir/$folderorfile")) { 
				$dirsize += getdirsize("$dir/$folderorfile"); 
			}else{ 
				$dirsize += filesize("$dir/$folderorfile"); 
			}
		}    
	}
	closedir($dirlist);
	return $dirsize;
}
//生成热门关键词JS
function admin_ff_hot_key($string){
	$array_hot = array();
	foreach(explode(chr(13),trim($string)) as $key=>$value){
		$array = explode('|',$value);
		if($array[1]){
			$array_hot[$key] = '<a href="'.$array[1].'" target="_blank">'.trim($array[0]).'</a>';
		}else{
			$array_hot[$key] = '<a href="'.ff_url('vod/search',array('wd'=>urlencode(trim($value))),true).'">'.trim($value).'</a>';
		}
	}
	$hotkey = implode(' ',$array_hot);
	$hotkey = 'document.write(\''.$hotkey.'\');';
	write_file('./Runtime/Js/hotkey.js',$hotkey);
}
//替换采集等通过url参数传值
function admin_ff_url_repalce($xmlurl,$order='asc'){
	if($order=='asc'){
		return str_replace(array('|','@','#','||'),array('/','=','&','//'),$xmlurl);
	}else{
		return str_replace(array('/','=','&','||'),array('|','@','#','//'),$xmlurl);
	}	
}
//通过标签分类返回对应的模块
function admin_ff_taglist2modelname($tag_list){
	if( in_array($tag_list, array('vod_tag','vod_type')) ){
	    return 'Vod';
	}elseif( in_array($tag_list, array('news_tag','news_type')) ){
	    return 'News';
	}
}
//分页样式
function getpage($currentPage,$totalPages,$halfPer=5,$url,$pagego){
    $linkPage .= ( $currentPage > 1 )
        ? '<a href="'.str_replace('FFLINK',1,$url).'" class="pagegbk">Home</a>&nbsp;<a href="'.str_replace('FFLINK',($currentPage-1),$url).'" class="pagegbk">Previous page</a>&nbsp;' 
        : '<em>Home</em>&nbsp;<em>Previous page</em>&nbsp;';
    for($i=$currentPage-$halfPer,$i>1||$i=1,$j=$currentPage+$halfPer,$j<$totalPages||$j=$totalPages;$i<$j+1;$i++){
        $linkPage .= ($i==$currentPage)?'<span>'.$i.'</span>&nbsp;':'<a href="'.str_replace('FFLINK',$i,$url).'">'.$i.'</a>&nbsp;'; 
    }
    $linkPage .= ( $currentPage < $totalPages )
        ? '<a href="'.str_replace('FFLINK',($currentPage+1),$url).'" class="pagegbk">Next page</a>&nbsp;<a href="'.str_replace('FFLINK',$totalPages,$url).'" class="pagegbk">last page</a>'
        : '<em>Next page</em>&nbsp;<em>last page</em>';
	if(!empty($pagego)){
		$linkPage .='&nbsp;<input type="input" name="page" id="page" size=4 class="pagego"/><input type="button" value="Jump" onclick="'.$pagego.'" class="pagebtn" />';
	}
	//
	if(C('url_html') && C('url_html_list')){
    	return str_replace('-1'.C('html_file_suffix'),C('html_file_suffix'),str_replace('index1'.C('html_file_suffix'),'',$linkPage));
	}else{
		return $linkPage;
	}
}
// 获取数据库表名描述
function ff_table_name($tablename){
	if (strpos($tablename,'ads')>0){
		return 'advertising';
	}
	if (strpos($tablename,'news')>0){
		return 'article';
	}
	if (strpos($tablename,'vod')>0){
		return 'video';
	}
	if (strpos($tablename,'list')>0){
		return 'Column';
	}
	if (strpos($tablename,'forum')>0){
		return 'comment';
	}
	if (strpos($tablename,'admin')>0){
		return 'administrator';
	}
	if (strpos($tablename,'special')>0){
		return 'Topic';
	}
	if (strpos($tablename,'user')>0){
		return 'user';
	}
	if (strpos($tablename,'slide')>0){
		return 'Rotation';
	}	
	if (strpos($tablename,'link')>0){
		return 'Links';
	}
	if (strpos($tablename,'cj')>0){
		return 'collection';
	}	
	if (strpos($tablename,'tag')>0){
		return 'label';
	}
	if (strpos($tablename,'nav')>0){
		return 'navigation';
	}	
	if (strpos($tablename,'player')>0){
		return 'player';
	}											
}
//获取模板编辑名称
function ff_tpl_name($filename){
	if('footer.tpl' == $filename){
	    return 'Bottom public template';
	}elseif('header.tpl' == $filename){
	    return 'Top public template';
	}elseif('index.tpl' == $filename){
	    return 'Home template';
	}elseif('news_detail.tpl' == $filename){
	    return 'Article content template';
	}elseif('news_channel.tpl' == $filename){
	    return 'Article channel list template';
	}elseif('news_list.tpl' == $filename){
	    return 'Article list page template';
	}elseif('news_search.tpl' == $filename){
	    return 'Article search template';
	}elseif('news_tags.tpl' == $filename){
	    return 'Article tag template';
	}elseif('news_type.tpl' == $filename){
	    return 'Article filter template';
	}elseif('vod_play.tpl' == $filename){
	    return 'Play the page template';
	}elseif('vod_detail.tpl' == $filename){
	    return 'Video content template';
	}elseif('vod_list.tpl' == $filename){
	    return 'Video list page template';
	}elseif('vod_channel.tpl' == $filename){
	    return 'Video channel list template';
	}elseif('vod_search.tpl' == $filename){
	    return 'Video search template';
	}elseif('vod_tags.tpl' == $filename){
	    return 'Video tag template';
	}elseif('vod_type.tpl' == $filename){
	    return 'Video filtering template';
	}elseif('vod_rss.tpl' == $filename){
	    return 'Video RSS template';
	}elseif('special_list.tpl' == $filename){
	    return 'Topic list page template';
	}elseif('special_detail.tpl' == $filename){
	    return 'Topic page template';
	}elseif('comment.tpl' == $filename){
	    return 'Comment template';
	}elseif('guestbook.tpl' == $filename){
	    return 'Message template';
	}elseif('system.css' == $filename){
	    return 'Template theme style sheet';
	}elseif('system.js' == $filename){
	    return 'Javascript文件';
	}else{
		if(stristr($filename,'my_')){
	   	return 'Custom templates';
		}elseif(stristr($filename,'map_')){
	   	return 'Map page template';
		}elseif(stristr($filename,'block_')){
	   	return 'Block label';
		}elseif(stristr($filename,'wap_')){
	    return 'Move the module template';
		}else{
	    return 'Unknown file';
		}
	}
}
?>