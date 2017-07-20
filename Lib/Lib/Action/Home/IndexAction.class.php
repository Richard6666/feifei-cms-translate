<?php
class IndexAction extends HomeAction{
	public function index(){
		if (!is_file('./Runtime/Install/install.lock')) {
			$this->assign("jumpUrl",'?s=Admin-Install');
			$this->error('You have not installed the program, please run install.php Into the installation!');
		}
		if(C('url_html')){
			redirect('index'.C('url_html_suffix'));
		}
		$this->assign($this->Lable_Index());
		$this->display('index');
	}
}
?>