<?php
class TplAction extends BaseAction{	
	// 显示模板管理
  public function show(){
		$dirpath = $this->dirpath();//当前目录
		$dirlast = $this->dirlast();//上一层目录
		import("ORG.Io.Dir");
		$dir = new Dir($dirpath);
		$list_dir = $dir->toArray();
		if (empty($list_dir)){
			$this->error('There is no file below this folder!');
		}
		foreach($list_dir as $key=>$value){
			$list_dir[$key]['pathfile'] = admin_ff_url_repalce($value['path'],'desc').'|'.$value['filename'];
		}
		$_SESSION['tpl_jumpurl'] = '?s=Admin-Tpl-Show-id-'.admin_ff_url_repalce($dirpath,'desc');
		if($dirlast && $dirlast != '.'){
			$this->assign('dirlast',admin_ff_url_repalce($dirlast,'desc'));
		}		
		$this->assign('dirpath',$dirpath);
		$this->assign('list_dir',list_sort_by($list_dir,'mtime','desc'));
		$this->display('./Public/system/tpl_show.html');
  }
	//获取模板当前路径
	public function dirpath(){
		$id = admin_ff_url_repalce(trim($_GET['id']));
		if ($id) {
			$dirpath = $id;
		}else{
			$dirpath = TMPL_PATH;
		}
		if (!strpos($dirpath,'Tpl')) {
			$this->error('Not within the template folder!');
		}
		return $dirpath;
	}
	//获取模板上一层路径
	public function dirlast(){
		$id = admin_ff_url_repalce(trim($_GET['id']));
		if ($id) {
			return substr($id,0,strrpos($id, '/'));
		}else{
			return false;
		}
	}		
	// 编辑模板
	public function add(){
		$filename = admin_ff_url_repalce(str_replace('*','.',trim($_GET['id'])));
		if (empty($filename)) {
			$this->error('Template name can not be empty!');
		}
		$content = read_file($filename);
		$this->assign('filename',$filename);
		$this->assign('content',htmlspecialchars($content));
		$this->display('./Public/system/tpl_add.html');
	}
	// 更新模板
	public function update(){
		$filename = trim($_POST['filename']);
		if (empty($filename)) {
			$this->error('Template file name can not be empty!');
		}		
		if( !in_array( strrchr($filename,"."), array('.html','.htm','.shtml','.shtm','.xml','.js','.css','.tpl')) ){
			$this->error('Template format is wrong!');
		}
		//
		$content = stripslashes(htmlspecialchars_decode($_POST['content']));
		if (empty($content)) {
			$this->error('Template content can not be empty!');
		}		
		if (!testwrite(substr($filename,0,strrpos($filename,'/')))){
			$this->error('Online editing templates need to be given'.TEMPLATE_PATH.'Add write permission!');
		}
		write_file($filename,$content);
		if (!empty($_SESSION['tpl_jumpurl'])) {
			$this->assign("jumpUrl",$_SESSION['tpl_jumpurl']);
		}else{
			$this->assign("jumpUrl",'?s=Admin/Tpl/Show');
		}
		$this->success('Congratulations, template update success!');
	}
	// 删除模板
  public function del(){
		$id = admin_ff_url_repalce(str_replace('*','.',trim($_GET['id'])));
		if (!substr(sprintf("%o",fileperms($id)),-3)){
			$this->error('No delete permission!');
		}
		@unlink($id);
		if (!empty($_SESSION['tpl_jumpurl'])) {
			$this->assign("jumpUrl",$_SESSION['tpl_jumpurl']);
		}else{
			$this->assign("jumpUrl",'?s=Admin/Tpl/Show');
		}
		$this->success('Delete file successfully!');
  }				
}
?>