<switch name="list_name">
<case value="the film">
	{$vod_state}
</case>
<case value="TV series">
	<eq name="vod_isend" value="1">
    <gt name="vod_total" value="0">
      {$vod_total}Set all
    <else/>
      {$vod_continu|default='all'}set
    </gt>
  <else/>
    <if condition="$vod_continu eq $vod_total">
      <gt name="vod_total" value="0">
        {$vod_total}Set all
      <else/>
        {$vod_continu|default='all'}set
      </gt>
    <elseif condition="$vod_continu lt $vod_total"/>
    	<gt name="vod_continu" value="0">
        Update to{$vod_continu}set
      <else/>
        {$vod_continu|default='all'}set
      </gt>
    <elseif condition="$vod_continu gt $vod_total"/>
    	all{$vod_continu|default=''}set
    </if>
  </eq>
</case>
<case value="Anime">
	<eq name="vod_isend" value="1">
    <gt name="vod_total" value="0">
      {$vod_total}Set all
    <else/>
      {$vod_continu|default='all'}set
    </gt>
  <else/>
    <if condition="$vod_continu eq $vod_total">
      <gt name="vod_total" value="0">
        {$vod_total}Set all
      <else/>
        {$vod_continu|default='全'}set
      </gt>
    <elseif condition="$vod_continu lt $vod_total"/>
    	<gt name="vod_continu" value="0">
        Update to{$vod_continu}set
      <else/>
        {$vod_continu|default='全'}set
      </gt>
    <elseif condition="$vod_continu gt $vod_total"/>
    	全{$vod_continu|default=''}set
    </if>
  </eq>
</case>
<case value="Variety">
	<if condition="strlen($vod_continu) gt 6">
    {$vod_continu|strtotime|date='Y-m-d',###}
  <else/>
    {$vod_continu}period
  </if>
</case>
<default />
</switch>