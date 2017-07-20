<?php 
class AdminModel extends AdvModel {
	protected $_validate=array(
		array('admin_name','require','The administrator name must be filled in!',1,'',1),
		array('admin_pwd','require','The administrator password must be filled in!',1,'',1),
		array('admin_repwd','admin_pwd','The password entered twice is inconsistent,please enter again!',1,'confirm','',3),
		array('admin_name','','Account name already exists!',1,'unique',1),
	);
	protected $_auto=array(
		array('admin_pwd','admin_pwd',3,'callback'),
		array('admin_count','0'),
		array('admin_ip','get_client_ip',3,'function'),
		array('admin_logintime','time',1,'function'),
	);
	public function admin_pwd(){
		if (empty($_POST['admin_pwd'])) {
		    return false;
		}else{
		    return md5($_POST['admin_pwd']);
		}
	}
}
?>