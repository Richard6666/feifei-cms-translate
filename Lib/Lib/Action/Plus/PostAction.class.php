<?php
class PostAction extends HomeAction{
	
	public function _initialize(){
		if(C('collect_passwd')){
			if(trim(C('collect_passwd')) != htmlspecialchars($_POST['collect_passwd'])){
				exit( 'Incorrect password.' );
			}
		}else{
			exit( 'Please set your password in the background.' );
		}
  }

	public function vod(){
		$data = D('VodXml')->xml_insert($_POST);
		if(!$data){
			exit($rs->getError());
		}
		echo $data;
  }	
	
	public function news(){
		$data = D('NewsXml')->xml_insert($_POST);
		if(!$data){
			exit($rs->getError());
		}
		echo $data;
  }					
}
?>