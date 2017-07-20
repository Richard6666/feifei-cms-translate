<div class="visible-lg visible-md">
<volist name="vod_play_list" id="feifei" key="k">
<eq name="feifei.player_name_en" value="down">
  <div class="clearfix ff-clearfix"></div>
  <div class="page-header">
    <h4><span class="glyphicon glyphicon-download ff-text"></span> Download watch</h4>
  </div>
  <ul class="list-unstyled ff-down-list">
    <div class="row">
      <div class="col-xs-9">
        <p class="text-muted">Tips: do not install the tool, it will automatically prompt to install, after installation can be high-speed download.</p>
      </div>
      <div class="col-xs-3">
        <a class="btn btn-primary btn-sm thunder_down_all" href="javascript:;">Thunder batch</a>
     		<a class="btn btn-primary btn-sm xf_down_all" href="javascript:void(0);">Whirlwind lot</a>
      </div>
    </div>
    <volist name="feifei.son" id="feifeison" key="pid">
    <div class="row">
      <div class="col-xs-9">
        <div class="input-group">
          <span class="input-group-addon">
          <input type="checkbox" class="down_url" name="down_url_list_0" value="{$feifeison.url|ff_ThunderEncode}" file_name="{$feifeison.title}" checked="checked">
          </span>
          <input type="text" class="form-control" value="{$feifeison.title} {$feifeison.url|ff_ThunderEncode}">
        </div>
      </div>
      <div class="col-xs-3">
        <button type="button" class="btn btn-success btn-sm thunder_down">Thunder download</button>
        <button type="button" class="btn btn-warning btn-sm qqdl">Whirlwind download</button>
      </div>
    </div>
    </volist>
  </ul>
</eq>
</volist>
</div>