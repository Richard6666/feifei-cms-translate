 <?php
class TagAction extends BaseAction{	
	// 显示标签列表
  public function show(){
		//生成查询参数
		$admin['p'] = '';
		//组合分页信息
		$limit = 20;
		$rs = new Model() ;
		$count = $rs->query("select count(1) as count from (select  *  from ".C('db_prefix')."tag  group by tag_list,tag_name ) aa");
		$count = $count[0]['count'];
		$totalpages = ceil($count/$limit);
		$currentpage = !empty($_GET['p'])?intval($_GET['p']):1;
		$currentpage = ff_page_max($currentpage,$totalpages);//$admin['page'] = $currentpage;
		$pageurl = U('Admin-Tag/Show',$admin,false,false).'FFLINK'.C('url_html_suffix');
		$admin['p'] = $currentpage;
		$pages = '共'.$count.'A label&nbsp;current:'.$currentpage.'/'.$totalpages.'page&nbsp;'.getpage($currentpage,$totalpages,8,$pageurl,'pagego(\''.$pageurl.'\','.$totalpages.')');
		$admin['pages'] = $pages;
		//查询数据
		$rs = D("Tag");
		$array = $rs->field('*,count(tag_name) as tag_count')->limit($limit)->page($currentpage)->group('tag_list,tag_name')->order('tag_count desc')->select();
		foreach($array as $key=>$val){
			$array[$key]['tag_url'] = U('Admin-'.admin_ff_taglist2modelname($array[$key]['tag_list']).'/Show',array('tag_name'=>urlencode($array[$key]['tag_name']),'tag_list'=>urlencode($array[$key]['tag_list'])),'',false,true);
		}		
		$this->assign($admin);
		$this->assign('list_tag',$array);
		$this->display('./Public/system/tag_show.html');
  }	
	// 显示标签AJAX方式
  public function showajax(){
		$rs = D("Tag");
		$where['tag_list'] = array('eq',$_GET['sid']);
		$array = $rs->field('*,count(tag_name) as tag_count')->where($where)->limit('15')->group('tag_name,tag_list')->order('tag_count desc')->select();
		$this->assign('tag_input',trim($_GET['input']));
		$this->assign('tag_list',$array);
		$this->display('./Public/system/tag_ajax.html');
  }
	// 删除标签
  public function del(){
		$rs = D("Tag");
		$where['tag_name'] = trim($_GET['id']);
		$rs->where($where)->delete();
		$this->success('label:'.$tag.'successfully deleted!');
  }									
}
?>