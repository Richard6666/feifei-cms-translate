<?php
class DataAction extends BaseAction{
	// 数据库备份展示	
  public function show(){
		$rs = new Model();
		$list = $rs->query('SHOW TABLES FROM '.C('db_name'));
		$tablearr = array();
        foreach ($list as $key => $val) {
            $tablearr[$key] = current($val);
        }
		$this->assign('list_table',$tablearr);
		$this->display('./Public/system/data_show.html');
  }
	//处理数据库备份
	public function insert(){
		if(empty($_POST['ids'])){
			$this->error('Please select the database table you want to back up!');
		}	
		$filesize = intval($_POST['filesize']);
		if ($filesize < 512) {
			$this->error('error,Please set an integer value greater than 512 for the volume size!');
		}
		$file = DATA_PATH.'_bak/';
		$random = md5(mt_rand(10000, 99999));
		$sql = ''; 
		$p = 1;
		foreach($_POST['ids'] as $table){
			$rs = D('Admin.'.str_replace(C('db_prefix'),'',$table));
			$array = $rs->select();
			$sql.= "TRUNCATE TABLE `$table`;\n";
			foreach($array as $value){
				$sql.= $this->insertsql($table, $value);
				if (strlen($sql) >= $filesize*1000) {
					$filename = $file.date('Ymd').'_'.$random.'_'.$p.'.sql';
					write_file($filename,$sql);
					$p++;
					$sql='';
				}
			}
		}
		if(!empty($sql)){
			$filename = $file.date('Ymd').'_'.$random.'_'.$p.'.sql';
			write_file($filename,$sql);
		}
		$this->assign("jumpUrl",'?s=Admin-Data-Show');
		$this->success('The database volume backup is complete,Divided into'.$p.'Sql file stored!');
  }
	//生成SQL备份语句
	public function insertsql($table, $row){
		$sql = "INSERT INTO `{$table}` VALUES ("; 
		$values = array(); 
		foreach ($row as $value) { 
			$values[] = "'" . mysql_real_escape_string($value) . "'"; 
		} 
		$sql .= implode(', ', $values) . ");\n"; 
		return $sql;
	}
	//展示还原
  public function restore(){
		$filepath = DATA_PATH.'_bak/*.sql';
		$filearr = glob($filepath);
		if (!empty($filearr)) {
			foreach($filearr as $k=>$sqlfile){
				preg_match("/([0-9]{8}_[0-9a-z]{32}_)([0-9]+)\.sql/i",basename($sqlfile),$num);
				$restore[$k]['filename'] = basename($sqlfile);
				$restore[$k]['filesize'] = round(filesize($sqlfile)/(1024*1024), 2);
				$restore[$k]['maketime'] = date('Y-m-d H:i:s', filemtime($sqlfile));
				$restore[$k]['pre'] = $num[1];
				$restore[$k]['number'] = $num[2];
				$restore[$k]['path'] = DATA_PATH.'_bak/';
			}
			$this->assign('list_restore',$restore);
      $this->display('./Public/system/data_restore.html');
		}else{
			$this->assign("jumpUrl",'?s=Admin-Data-Show');
			$this->error('No backup files were detected,Please back up or upload the backup file to'.DATA_PATH.'_bak/');
		}
  }
	//导入还原
	public function back(){
		$rs = new Model();
		$pre = $_GET['id'];
		$fileid = $_GET['fileid'] ? intval($_GET['fileid']) : 1;
		$filename = $pre.$fileid.'.sql';
		$filepath = DATA_PATH.'_bak/'.$filename;
		if(file_exists($filepath)){
			$sql = read_file($filepath);
			$sql = str_replace("\r\n", "\n", $sql); 
			foreach(explode(";\n", trim($sql)) as $query) {
				$rs->query(trim($query));
			}
			$this->assign("jumpUrl",'?s=Admin-Data-Back-id-'.$pre.'-fileid-'.($fileid+1).'');
			$this->success('第'.$fileid.'A backup file was restored successfully,Ready to restore the next one,Please wait!');
		}else{
			$this->assign("jumpUrl",'?s=Admin-Data-Show');
			$this->success('Database recovery is successful!');
		}
		
	}
	//下载还原
	public function down(){
		$filepath = DATA_PATH.'_bak/'.$_GET['id'];
		if (file_exists($filepath)) {
			$filename = $filename ? $filename : basename($filepath);
			$filetype = trim(substr(strrchr($filename, '.'), 1));
			$filesize = filesize($filepath);
			header('Cache-control: max-age=31536000');
			header('Expires: '.gmdate('D, d M Y H:i:s', time() + 31536000).' GMT');
			header('Content-Encoding: none');
			header('Content-Length: '.$filesize);
			header('Content-Disposition: attachment; filename='.$filename);
			header('Content-Type: '.$filetype);
			readfile($filepath);
			exit;
		}else{
			$this->error('error,Did not find the sub-volume file!');
		}
	}
	//删除分卷文件
	public function del(){
		$filename = trim($_GET['id']);
		@unlink(DATA_PATH.'_bak/'.$filename);
		$this->success($filename.'deleted!');
	}
	//删除所有分卷文件
	public function delall(){
		foreach($_POST['ids'] as $value){
			@unlink(DATA_PATH.'_bak/'.$value);
		}
		$this->success('Batch delete the volume file successfully!');
	}
	//展示高级SQL
  public function sql(){
		$this->display('./Public/system/data_sql.html');
  }
	//执行SQL语句
  public function upsql(){
		$sql = trim($_POST['sql']);
		if (empty($sql)) {
			$this->error('SQL statement can not be empty!');
		}else{
			$rs = new Model();
			$array_sql = explode(';', $sql);
			foreach($array_sql as $key=>$value){
				$rs->query(trim(stripslashes($value)));
				dump($rs->getLastSql());
			}
			$this->assign("waitSecond",20);
			$this->success('SQL statement runs successfully!');
		}
  }
	//展示批量替换
  public function replace(){
		$rs = new Model();
		$list = $rs->query('SHOW TABLES FROM '.C('db_name'));
		$tablearr = array();
        foreach ($list as $key => $val) {
            $tablearr[$key] = current($val);
        }
		$this->assign('list_table',$tablearr);	
		$this->display('./Public/system/data_replace.html');
  }	
	//Ajax展示字段信息
  public function ajaxfields(){
		$id = str_replace(C('db_prefix'),'',$_GET['id']);
		if (!empty($id)) {
			$rs = D("Admin.".$id);
			$array = $rs->getDbFields();
			echo "<div style='border:2px solid #eee;background-color:#FEFFF0;padding:5px;'>";
			echo "<p>table(".C('db_prefix').$id.")Fields included:<p><p>";
			foreach($array as $key=>$val){
				if(!is_int($key)){
					break;
				}
				if (ereg("cfile|username|userpwd|user|pwd",$val)){
					continue;
				}
				echo "<a href=\"javascript:rpfield('".$val."')\">".$val."</a>\r\n";
			}
			echo "</p></div>";
		}else{
			echo 'no fields';
		}
  }
	//执行批量替换
  public function upreplace(){
		if(empty($_POST['rpfield'])){
			$this->error("Please manually specify the fields to replace!");
		}
		if(empty($_POST['rpstring'])){
			$this->error("Please specify the content to be replaced!");
		}
		$exptable = str_replace(C('db_prefix'),'',$_POST['exptable']);
		$rs = D("Admin.".$exptable);
		$exptable = C('db_prefix').$exptable;//表
		$rpfield = trim($_POST['rpfield']);//字段
		$rpstring = $_POST['rpstring'];//被替换的
		$tostring = $_POST['tostring'];//替换内容
		$condition = trim(stripslashes($_POST['condition']));//条件
		$condition = empty($condition) ? '' : " where $condition ";
		$rs->execute(" update $exptable set $rpfield = Replace($rpfield,'$rpstring','$tostring') $condition ");
		$lastsql = $rs->getLastSql();
		$this->success('Batch replacement is complete!SQL execution statement!<br>'.$lastsql);
  }										
}
?>