<?php
class PlayerModel extends AdvModel {
	//自动验证
	protected $_validate=array(
		array('player_name_zh','require','Player name must be filled in!',1),
		array('player_name_en','require','Player logo must be filled in!',1),
	);
}
?>