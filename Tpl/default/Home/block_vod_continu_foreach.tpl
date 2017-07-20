<span class="badge">
<switch name="feifei.list_name">
<case value="the film">
	{$feifei.vod_gold}分
</case>
<case value="TV series">
	<eq name="feifei.vod_isend" value="1">
    <gt name="feifei.vod_total" value="0">
      {$feifei.vod_total}Set all
    <else/>
      {$feifei.vod_continu|default='all'}set
    </gt>
  <else/>
    <if condition="$feifei['vod_continu'] eq $feifei['vod_total']">
      <gt name="feifei.vod_total" value="0">
        {$feifei.vod_total}Set all
      <else/>
        {$feifei.vod_continu|default='all'}set
      </gt>
    <elseif condition="$feifei['vod_continu'] lt $feifei['vod_total']"/>
   	 <gt name="feifei.vod_continu" value="0">
      	Update to{$feifei.vod_continu}set
      <else/>
        Complete Works
      </gt>
     <elseif condition="$feifei['vod_continu'] gt $feifei['vod_total']"/>
     	all{$feifei.vod_continu|default=''}set
    </if>
  </eq>
</case>
<case value="Anime">
	<eq name="feifei.vod_isend" value="1">
    <gt name="feifei.vod_total" value="0">
      {$feifei.vod_total}Set all
    <else/>
      {$feifei.vod_continu|default='all'}set
    </gt>
  <else/>
    <if condition="$feifei['vod_continu'] eq $feifei['vod_total']">
      <gt name="feifei.vod_total" value="0">
        {$feifei.vod_total}Set all
      <else/>
        {$feifei.vod_continu|default='all'}set
      </gt>
    <elseif condition="$feifei['vod_continu'] lt $feifei['vod_total']"/>
      <gt name="feifei.vod_continu" value="0">
        Update to{$feifei.vod_continu}set
      <else/>
        Complete Works
      </gt>
     <elseif condition="$feifei['vod_continu'] gt $feifei['vod_total']"/>
     	全{$feifei.vod_continu|default=''}set
    </if>
  </eq>
</case>
<case value="Variety">
	<if condition="strlen($feifei['vod_continu']) gt 6">
    {$feifei.vod_continu|strtotime|date='Y-m-d',###}
  <else/>
    {$feifei.vod_continu}period
  </if>
</case>
<default />
HD
</switch>
</span>