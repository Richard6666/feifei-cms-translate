<?php
class SpecialAction extends BaseAction{	
	private $id;
	// 显示专题
  public function show(){
		//获取地址栏参数
		$admin['cid']= $_REQUEST['cid'];
		$admin['continu'] = $_REQUEST['continu'];
		$admin['status'] = intval($_REQUEST['status']);
		$admin['player'] = trim($_REQUEST['player']);
		$admin['stars'] = intval($_REQUEST['stars']);
		$admin['type'] = !empty($_GET['type'])?$_GET['type']:C('admin_order_type');
		$admin['order'] = !empty($_GET['order'])?$_GET['order']:'desc';
		$admin['orders'] = 'special_'.$admin["type"].' '.$admin['order'];
		$admin['p'] = '';
		//生成查询参数
		$limit = 20;
		$order = 'special_'.$admin["type"].' '.$admin['order'];
		//组合分页信息
		$rs = D("Special");
		$count = $rs->count('special_id');
		$totalpages = ceil($count/$limit);
		$currentpage = !empty($_GET['p'])?intval($_GET['p']):1;
		$currentpage = ff_page_max($currentpage,$totalpages);
		$pageurl = U('Admin-Special/Show',$admin,false,false).'FFLINK'.C('url_html_suffix');
		$admin['p'] = $currentpage;
		$pages = '共'.$count.'Articles&nbsp;current:'.$currentpage.'/'.$totalpages.'page&nbsp;'.getpage($currentpage,$totalpages,8,$pageurl,'pagego(\''.$pageurl.'\','.$totalpages.')');
		$admin['pages'] = $pages;
		//查询数据	
		$list = $rs->where($where)->page($currentpage)->limit($limit)->order($order)->select();
		foreach($list as $key=>$val){
			$list[$key]['special_url'] = ff_url('special/read', array('id'=>$list[$key]['special_id']), true);
			$list[$key]['special_starsarr'] = admin_star_arr($list[$key]['special_stars']);
		}
		$this->assign($admin);
		$this->assign('list',$list);
		$this->display('./Public/system/special_show.html');
  }
	// 添加与编辑专题
  public function add(){
		$where = array();
		$where['special_id'] = intval($_GET['id']);
		if ($where['special_id']) {
			$rs = D("Special");
			$array = $rs->ff_find('*', $where);
			$array['tpltitle'] = 'edit';
			$array['special_starsarr'] = admin_star_arr($array['special_stars']);
			foreach($array['Tag'] as $key=>$value){
				$tag[$value['tag_list']][$key] = $value['tag_name'];
			}
			$array['special_type'] = implode(',',$tag['special_type']);
		}else{
			$array['special_starsarr'] = admin_star_arr(1);
			$array['special_addtime'] = time();
			$array['tpltitle'] = 'Add to';
			$array['countvod'] = 0;
			$array['countnews'] = 0;		
		}
		$this->assign($array);
		$this->display('./Public/system/special_add.html');
  }
	//新增与更新数据
	public function update(){
		$rs = D('Special');
		$data = $rs->update($_POST);
		if(!$data){
			$this->error($rs->getError());
		}
		$this->id = $data['special_id'];
	}
	//更新数据缓存
	public function _after_update(){
		if(C('cache_page_special')){
			S('cache_page_special_'.intval($_POST['special_id']),NULL);
		}
		$this->assign("jumpUrl",'?s=Admin-Special-Show');
		$this->success('Congratulations, database, cache, static all operations have been completed!');
	}	
	// 隐藏与显示专题
  public function status(){
		$where['special_id'] = intval($_GET['id']);
		$rs = D("Special");
		if(intval($_GET['sid'])){
			$rs->where($where)->setField('special_status',1);
		}else{
			$rs->where($where)->setField('special_status',0);
		}
		redirect($_SERVER['HTTP_REFERER']);
  }
	// 删除专题
  public function del(){
		$this->delfile(intval($_GET['id']));
		$this->redirect('?s=Admin-Special-Show');
  }
	// 删除专题all
  public function delall(){
		if(empty($_POST['ids'])){
			$this->error('Please select the topic you want to delete!');
		}	
		$array = $_POST['ids'];
		foreach($array as $val){
			$this->delfile($val);
		}
		redirect($_SERVER['HTTP_REFERER']);
  }
	// 删除静态文件与图片
  public function delfile($id){
		$where['special_id'] = $id;
		$rs = D("Special");
		$rs->where($where)->delete();
  }
	// Ajax设置星级
  public function ajaxstars(){
		$where['special_id'] = intval($_GET['id']);
		$data['special_stars'] = intval($_GET['stars']);
		$rs = D("Special");
		$rs->where($where)->save($data);
		echo('ok');
  }
}
?>