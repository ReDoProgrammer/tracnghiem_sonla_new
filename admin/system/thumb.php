<?php
/*liem*/defined('SLA') or die('Restricted access');
function save_scaled($img_name, $dst_image_name, $ext, $max_width, $max_height)
	{
		$size = getimagesize($img_name);
		$width = $size[0];
		$height = $size[1];
		if($max_width == 0)
		{
			$max_width = $width;
		}
		if($max_height == 0)
		{
			$max_height = $height;
		}
		
		$src = image_create_from($img_name, $ext);
				
		if ($width <= $max_width)
		{
			if ($height <= $max_height)
			{
				$tn_width = $width;
				$tn_height = $height;
			}
			else
			{
				$tn_height = $max_height;
				$tn_width = round($max_height * $width / $height );
			}
		}
		elseif ($height <= $max_height)
		{
			$tn_width = $max_width;
			$tn_height = round($max_width * $height / $width);
		}
		else
		{
			$x_ratio = $max_width / $width;
			$y_ratio = $max_height / $height;
			
			if ($x_ratio <= $y_ratio)
			{
				$tn_width = $max_width;
				$tn_height = round($x_ratio * $height);
			}
			else
			{
				$tn_height = $max_height;
				$tn_width = round($y_ratio * $width);
			}
		}
		
		$dst = imagecreatetruecolor($tn_width, $tn_height);
		// imagecopyresampled($dst, $src, 0, 0, 0, 0, imagesx($dst), imagesy($dst), $width, $height);
		imagecopyresampled($dst, $src, 0, 0, 0, 0, $tn_width, $tn_height, $width, $height);

		image_save($dst, $dst_image_name, $ext);
		
		imagedestroy($src);
		imagedestroy($dst);
	}
		function image_create_from($image_full_path, $type)
	{
		switch($type)
		{
		case 'jpg':
		case 'jpeg':
			$im = imagecreatefromjpeg($image_full_path);
			break;
		case 'png':
			$im = imagecreatefrompng($image_full_path); 
			break; 		
		case 'gif':
			$im = imagecreatefromgif ($image_full_path);
			break;
		default: // it never gets here
			print 'Invalid picture format: '.$type;
			exit;
		}
		return $im;
	}


	function image_save($image, &$image_full_path, $ext)
	{
		switch($ext)
		{
		case 'jpg':
		case 'jpeg':
			$im = imagejpeg($image, $image_full_path, 100);
			break;
		case 'png':
			$im = imagepng($image, $image_full_path);
			break; 		
		case 'gif':
			if (function_exists("imagegif"))
			{
				$im = imagegif($image, $image_full_path);
			}
			else
			{
				change_ext_to_jpg($image_full_path);
				$im = imagejpeg($image, $image_full_path, 100);
			}			
			break;
		default: // it never gets here
			print 'Invalid picture format: '.$ext;
			//exit;
		}
		return $im;
	}


?>