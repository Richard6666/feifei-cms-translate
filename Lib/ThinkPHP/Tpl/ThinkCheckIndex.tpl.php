<?php
// ThinkPHP环境探针布署模式
// Author：caolei@topthink.com
class IndexAction extends Action
{
    public function index()
    {
        header("Content-Type:text/html; charset=utf-8");
        $env_table = $this->check_env();
        echo $env_table;
    }

    public function check_env(){
        //预定义查询变量
      $info = array(
          'safe_mode'=>array('Run in safe mode',0),
          'allow_url_fopen'=>array('access URL Object','OFF','It is recommended to close'),
          'register_globals'=>array('Register global variables','OFF','It is recommended to close'),
          'magic_quotes_gpc'=>array('Magic quotation marks open','OFF','It is recommended to close'),
          'short_open_tag'=>array('Short tag support','OFF','It is recommended to close'),
          'magic_quotes_runtime'=>array('Auto Escape Overrides Characters','OFF','It is recommended to close'),
          'enable_dl'=>array('Allows dynamic loading of link libraries','OFF','It is recommended to open'),
          'display_errors'=>array('Displays an error message',0),
          'post_max_size'=>array('Post maximum amount of data',0),
          'upload_max_filesize'=>array('The maximum size of the uploaded file',0),
          'memory_limit'=>array('Script maximum memory usage',1),
       );

       $fun = array(
            'mysql_close'=>array('MySQL database','ON','It is recommended to use a MySQL database'),
            'gd_info'=>array('Graphics processing GD Library','ON','It is recommended to open the GD library'),
            'socket_accept'=>array('Socket support',0),
            'xml_set_object'=>array('XML parsing support','ON','It is recommended to open'),
            'gzclose'=>array('Compressed file support(Zlib)',0),
            'mcrypt_cbc'=>array('MCrypt encryption processing',0),
            'preg_match'=>array('PREL compatible grammar PCRE','ON','PREL syntax must be enabled for compatibility'),
        );
        //根据查询条件,动态赋值
        $phpversiON = phpversion();//获取php版本号
        $versiON_msg=versiON_compare(PHP_VERSION,'5.2.0','<')?'Recommended 5.2.0 or more':'Normal use';
        $run_env = strtoupper(php_sapi_name());//查看运行环境
        $os = PHP_OS;
        $is_rewrite = false;//预设rewrite为否定
        if (($is_apache=strpos($run_env,'APACHE'))!==false)
        {
            $apache_list = apache_get_modules();
            $is_rewrite = array_search('mod_rewrite',$apache_list)?true:false;
            unset($apache_list);
        }

        foreach ($info as $key => &$val)
        {
            $var = get_cfg_var($key)?get_cfg_var($key):ini_get($key);
            $val['value'] = ($var==0)?'OFF':(($var==1)?'ON':$var);
            if (is_numeric($val[1]) || $val['value']==$val[1])
            {
               $val['message'] = '<span class="blue">√</span>';
            }else{
                $val['message'] = '<span class="red">'.$val[2].'</span>';
            }
        }
        foreach ($fun as $key => &$val)
        {
            $val['value'] = functiON_exists($key)?'ON':'OFF';
            if (is_numeric($val[1]) || $val['value']==$val[1])
            {
               $val['message'] = '<span class="blue">√</span>';
            }else{
                $val['message'] = '<span class="red">'.$val[2].'</span>';
            }
        }
        $moban =<<<HTML
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="author" content="Topthink - <www.thinkphp.cn>" />
<meta name="Copyright" content="" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>ThinkPHP environmental testing</title>
<style type="text/css">
*{margin:0;padding:0}
    body{font:400 14px/2em 'Microsoft Yahei','Blackbody',Tahoma,sans-serif;text-align:center;background:#fff;}
    table {margin-top:10px;width:700px;}
    .red{color:red;font-weight:bold;}
    .blue{color:blue;}
    .title{background:#e8efff;font-weight:bold;font-size:14px;padding:10px;color:blue;}
    .thead{background-color:#E8EFFF;color:blue;}
    .thead td{padding:4px;font-weight:bold;font-size:14px;}
    .tbhead{font-weight:normal;text-align:left;}
    td{text-align:left;}
</style>
</head>
<body>
    <div class="title">^_^ Hello, welcome<span class="red">ThinkPHP</span>!</div>
    <table>
        <tr class='thead'><td colspan="2">Server parameters</td></tr>
        <tr><th class="tbhead">Server domain name/IP：</th><td>{$_SERVER['SERVER_NAME']} [{$_SERVER['REMOTE_ADDR']}]</td></tr>
        <tr><th class="tbhead">Service port:</th><td>{$_SERVER['SERVER_PORT']}</td></tr>
        <tr><th class="tbhead">Server type/version:</th><td>{$_SERVER['SERVER_SOFTWARE']}</td></tr>
        <tr><th class="tbhead">Server operating system:</th><td>{$os}</td></tr>
        <tr><th class="tbhead">Website root directory:</th><td>{$_SERVER['DOCUMENT_ROOT']}</td></tr>
        <tr><th class="tbhead">Current file location:</th><td>{$_SERVER['SCRIPT_FILENAME']}</td></tr>
    </table>
    <table>
    <tr>
        <th class='title'>Variable name</th><th class='title'>Current state</th><th class='title'>recommend</th>
    </tr>
    <tbody>
        <tr><th class='tbhead'>PHP version</th><td>{$phpversiON}</td><td>{$versiON_msg}</td></tr>
        <tr><th class='tbhead'>PHP operating environment</th><td>{$run_env}</td><td></td></tr>
HTML;
        $moban .="<tr><th class='tbhead'>Whether to open rewrite</th><td>";
        if ($is_apache===false)
        {
            $moban .= "Can not be detected</td><td></td></tr>";
        }else{
            $moban .= ($is_rewrite)?'<span color="green">Open</span>':'<span class="red">Unopened</span>';
            $moban .="</td><td></td></tr>";
        }
        $moban .="<tr class='thead'><td colspan='3'>PHP environment</td></tr>";
        foreach ($info as $key => $val)
        {
            $moban.="<tr><th class='tbhead'>{$val[0]} [{$key}]</th><td>{$val['value']}</td><td>{$val['message']}</td></tr>";
        }
        $moban .="<tr class='thead'><td colspan='3'>PHP module detection</td></tr>";

        foreach($fun as $key=>$val)
        {
            $moban.="<tr><th class='tbhead'>{$val[0]} [{$key}]</th><td>{$val['value']}</td><td>{$val['message']}</td></tr>";
        }
        $moban .="</tbody></table></body></html>";
        return $moban;
    }
}
?>