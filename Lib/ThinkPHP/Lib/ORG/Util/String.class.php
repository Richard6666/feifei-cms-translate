<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class String extends Think
{

    /**
     +----------------------------------------------------------
     * 生成UUID 单机使用
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
	 static public function uuid()
    {
        $charid = md5(uniqid(mt_rand(), true));
        $hyphen = chr(45);// "-"
        $uuid = chr(123)// "{"
               .substr($charid, 0, 8).$hyphen
               .substr($charid, 8, 4).$hyphen
               .substr($charid,12, 4).$hyphen
               .substr($charid,16, 4).$hyphen
               .substr($charid,20,12)
               .chr(125);// "}"
        return $uuid;
   }

	/**
	 +----------------------------------------------------------
	 * 生成Guid主键
	 +----------------------------------------------------------
	 * @return Boolean
	 +----------------------------------------------------------
	 */
	static public function keyGen() {
		return str_replace('-','',substr(String::uuid(),1,-1));
	}

	/**
	 +----------------------------------------------------------
	 * 检查字符串是否是UTF8编码
	 +----------------------------------------------------------
	 * @param string $string 字符串
	 +----------------------------------------------------------
	 * @return Boolean
	 +----------------------------------------------------------
	 */
	static public function is_utf8($str) {
		$c=0; $b=0;
		$bits=0;
		$len=strlen($str);
		for($i=0; $i<$len; $i++){
			$c=ord($str[$i]);
			if($c > 128){
				if(($c >= 254)) return false;
				elseif($c >= 252) $bits=6;
				elseif($c >= 248) $bits=5;
				elseif($c >= 240) $bits=4;
				elseif($c >= 224) $bits=3;
				elseif($c >= 192) $bits=2;
				else return false;
				if(($i+$bits) > $len) return false;
				while($bits > 1){
					$i++;
					$b=ord($str[$i]);
					if($b < 128 || $b > 191) return false;
					$bits--;
				}
			}
		}
		return true;
	}

	/**
	 +----------------------------------------------------------
	 * 字符串截取，支持中文和其他编码
	 +----------------------------------------------------------
	 * @static
	 * @access public
	 +----------------------------------------------------------
	 * @param string $str 需要转换的字符串
	 * @param string $start 开始位置
	 * @param string $length 截取长度
	 * @param string $charset 编码格式
	 * @param string $suffix 截断显示字符
	 +----------------------------------------------------------
	 * @return string
	 +----------------------------------------------------------
	 */
	static public function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true)
	{
		if(function_exists("mb_substr"))
			return mb_substr($str, $start, $length, $charset);
		elseif(function_exists('iconv_substr')) {
			return iconv_substr($str,$start,$length,$charset);
		}
		$re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
		$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
		$re['gbk']	  = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
		$re['big5']	  = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
		preg_match_all($re[$charset], $str, $match);
		$slice = join("",array_slice($match[0], $start, $length));
		if($suffix) return $slice."…";
		return $slice;
	}

	/**
	 +----------------------------------------------------------
	 * 产生随机字串，可用来自动生成密码
	 * 默认长度6位 字母和数字混合 支持中文
	 +----------------------------------------------------------
	 * @param string $len 长度
	 * @param string $type 字串类型
	 * 0 字母 1 数字 其它 混合
	 * @param string $addChars 额外字符
	 +----------------------------------------------------------
	 * @return string
	 +----------------------------------------------------------
	 */
	static public function rand_string($len=6,$type='',$addChars='') {
		$str ='';
		switch($type) {
			case 0:
				$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.$addChars;
				break;
			case 1:
				$chars= str_repeat('0123456789',3);
				break;
			case 2:
				$chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ'.$addChars;
				break;
			case 3:
				$chars='abcdefghijklmnopqrstuvwxyz'.$addChars;
				break;
			case 4:
				$chars = "We will be to him when he will be made to the domestic one is to work on the order of the people can be made into the people can not be in the big and the big man to the next to the students for the next level to a peer The surface of the kind of life and more than the child after the addition of small machine also by the power line of the power of the high number of long-term party has a solid state of the law of water and political struggle between the two political and political Anti-body road map to the knot is the beginning of the new article on the matter from when the two talented team approved the weight of their thinking and between the days of the situation due to the pressure from the gas industry on behalf of the group Lead the basis of the base or the moon if the shape of the heart can be like the heart of the dry do all the changes to change the show that it is the most and not to see the mention of the five solutions of the forest group rice group first only four Ma The article is more than the public and the public hole into the seat of the stationery and fly the oil to put the title of the title of the construction of the district to teach the public is very difficult to teach this permanent stone strong pole has been a large number of roots have been unified system Holding the total material even with the concept of the concept of seven mountains, South Canton labor rounds of the North plot car to the section of the service is the whole Step class set number of temperature that is known as the axle of the monolithic research system, The factory must be from the re-sub-sea right and the young people under the card of the low-off eight test test paper near the door to do the door to take the door to take the county soldiers to take special cramps and thousands of seats Ji Bai Ge effect push empty with leaves The rate of the election of the German selection of the odds of the semi-enemy head of the first piece of the sound of the Huaihua prepared by the name of the red drug is difficult to keep the standard To the gods of the village to do the village to do the non-engage in the caravan fire section of the calculation of the value of the United States and the United States, Check the left page of the Soviet Union was bitter bitter bitter soon to say that the United States and the United States and the United States and the United States, The body of the ring off the first foot of the wave of powder to practice the fish with the test carved enough to fill the full line of the Council to promote the branch of the post Words of the ball toward the medical school of ancient rice and rice to listen to the only slip station another Wei Guogong just write Liu slightly slightly for Block of a power set of limited items of the reincarnation of the volume of the wind to make the bone far to help the early birds to play the first share of the death ring So the size of the curtains of the women's clothing scattered soles of the work of the people of the cold and out of life, Slave side Run cover from the touch of the stars to be sent by the longevity of the monopoly of the Department of the Secretary of the United States and the United States and the United States and the United States, But if the spear of the thick Luo Mian provision of the egg box palm oxygen love love has been dissolved in the end of the first Mengmu to be exhausted Russia to shrink the retreat to withdraw from the suburbs of the child who pretends to correct the trough Drilled weak foot afraid of salt at the end of Yin Feng fog crown C Street Lepe infants to pay Kyrgyzstan infiltration of the United States and the United States and the United States, Forget the printing of the bee jihao Diaofei flying edge of the edge of the vibration of the vibration of the Central Wu domain is very fast-like exotic paper-free nocturnal tea for a long time, Tattoo charcoal charisma buds buds long wretched oval tassel pork yang rot please thoroughly through Whiskers should be laughing if the end of the tail Zhuangzhuang Sui Sui Chou more green drag cattle stained both autumn and forging Yu summer treatment of the tip of the quarry of the state of the United States and the United States and the United States and the United States, Shell thaw coal welcome to stick to find a thin shop in the righteousness of the righteousness of the righteousness of the righteousness of the demons of the thunderbolt. Zengjin financial instrument Jingzhe crime Zu Zu car to wear goods Zhuoqiu Zuotou pumping long library to keep the house song cold hi brother cleansing waste abdomen abdomen recorded mirror woman evil fat Luanqi Bridge Ober Road, the amount of the wall of the wall of the wall of the tranquility of the town of the town of the town of the United States and the United States, the United States, the United States, the United States, the United States, the United States, the United States, Yong Feng Huang Liu Ha Jie Gannuo Sannong Island attack who Hong Xie guns spotted speckled eggs to listen to the release of the child to release the milk Ju Ju private silver Iraqi Tanzania evenly mold Dole Lele performance strokes Hu Hu pain peak zero Chai Chaihunhun Shangdin Qin slightly chasing the beam of the loss of alkali and high-grade digging of the blade of the heap of the heap of the carved in the case of the film, Qiaoqi flag filter carbon charcoal sit steamed trapped in the guns rush to rescue the dark hole criminals you Song arc bursty taste The arm of the brown land of the wild ah pull the beans to pull the mountain arrived in the anti-Sang Piao Zhaotong pick up the ice mouth of the mouth of the mouth, Ma purple opera tower hammering the age of the appearance of clean and clean the front of the suspects flash floods flash brush rush suddenly trouble Qiao Tang leaked Shen melting chlorine barren man who grab the next side of the glass is also loyalty The light of the prisoners to take the prisoners captured the rust off the glass of the treasure core of the core of the secret of the net net Chiang Kai-shui Teng-sang throwing the end of the road mixed with the father to urge the willing to win the wine rope poor pond dry bubble bag Lang to feed the aluminum canal In the past, the anti - retreat of the hanging clothes".$addChars;
				break;
			default :
				// 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
				$chars='ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789'.$addChars;
				break;
		}
		if($len>10 ) {//位数过长重复字符串一定次数
			$chars= $type==1? str_repeat($chars,$len) : str_repeat($chars,5);
		}
		if($type!=4) {
			$chars   =   str_shuffle($chars);
			$str     =   substr($chars,0,$len);
		}else{
			// 中文随机字
			for($i=0;$i<$len;$i++){
			  $str.= self::msubstr($chars, floor(mt_rand(0,mb_strlen($chars,'utf-8')-1)),1);
			}
		}
		return $str;
	}

	/**
	 +----------------------------------------------------------
	 * 生成一定数量的随机数，并且不重复
	 +----------------------------------------------------------
	 * @param integer $number 数量
	 * @param string $len 长度
	 * @param string $type 字串类型
	 * 0 字母 1 数字 其它 混合
	 +----------------------------------------------------------
	 * @return string
	 +----------------------------------------------------------
	 */
	static public function build_count_rand ($number,$length=4,$mode=1) {
			if($mode==1 && $length<strlen($number) ) {
				//不足以生成一定数量的不重复数字
				return false;
			}
			$rand   =  array();
			for($i=0; $i<$number; $i++) {
				$rand[] =   rand_string($length,$mode);
			}
			$unqiue = array_unique($rand);
			if(count($unqiue)==count($rand)) {
				return $rand;
			}
			$count   = count($rand)-count($unqiue);
			for($i=0; $i<$count*3; $i++) {
				$rand[] =   rand_string($length,$mode);
			}
			$rand = array_slice(array_unique ($rand),0,$number);
			return $rand;
	}

	/**
	 +----------------------------------------------------------
	 *  带格式生成随机字符 支持批量生成
	 *  但可能存在重复
	 +----------------------------------------------------------
	 * @param string $format 字符格式
	 *     # 表示数字 * 表示字母和数字 $ 表示字母
	 * @param integer $number 生成数量
	 +----------------------------------------------------------
	 * @return string | array
	 +----------------------------------------------------------
	 */
	static public function build_format_rand($format,$number=1)
	{
		$str  =  array();
		$length =  strlen($format);
		for($j=0; $j<$number; $j++) {
			$strtemp   = '';
			for($i=0; $i<$length; $i++) {
				$char = substr($format,$i,1);
				switch($char){
					case "*"://字母和数字混合
						$strtemp   .= String::rand_string(1);
						break;
					case "#"://数字
						$strtemp  .= String::rand_string(1,1);
						break;
					case "$"://大写字母
						$strtemp .=  String::rand_string(1,2);
						break;
					default://其他格式均不转换
						$strtemp .=   $char;
						break;
			   }
			}
			$str[] = $strtemp;
		}

		return $number==1? $strtemp : $str ;
	}

	/**
	 +----------------------------------------------------------
	 * 获取一定范围内的随机数字 位数不足补零
	 +----------------------------------------------------------
	 * @param integer $min 最小值
	 * @param integer $max 最大值
	 +----------------------------------------------------------
	 * @return string
	 +----------------------------------------------------------
	 */
	static public function rand_number ($min, $max) {
		return sprintf("%0".strlen($max)."d", mt_rand($min,$max));
	}
}
?>