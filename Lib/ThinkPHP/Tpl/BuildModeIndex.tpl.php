<?php
// 可视化简约布署模式
class IndexAction extends Action
{
    public function index()
    {
        header("Content-Type:text/html; charset=utf-8");
        echo "Bootstrap deployment pattern, process to be added";
    }
}
?>