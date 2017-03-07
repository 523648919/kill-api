<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<title>抽奖活动</title>
	<link rel="stylesheet" type="text/css" href="resource/style/style.css">
	<!–[if IE]>
	<script src="resource/vue/html5.js"></script>
	<![endif]–>
	<style>
		/* music */
		@-webkit-keyframes reverseRotataZ{
			0%{-webkit-transform: rotateZ(0deg);}
			100%{-webkit-transform: rotateZ(-360deg);}
		}
		@-webkit-keyframes rotataZ{
			0%{-webkit-transform: rotateZ(0deg);}
			100%{-webkit-transform: rotateZ(360deg);}
		}
		#musicControl { position:fixed;right:10px;top:20px;margin-top:0;display:inline-block;z-index:99999999}
		#musicControl a { display:inline-block;width:25px;height:25px;overflow:hidden;background:url('resource/style/mcbg.png') no-repeat;background-size:100%;}
		#musicControl a audio{width:100%;height:56px;}
		#musicControl a.stop { background-position:left bottom;}
		#musicControl a.on { background-position:0px 1px;-webkit-animation: reverseRotataZ 1.2s linear infinite;}
		#music_play_filter{width:100%;height:100%;overflow:hidden;position:fixed;top:0;left:0;z-index:99999998;}
	</style>
</head>
<body>
<div class="bg">
	<img src="resource/style/bg.jpg">
</div>
<div id="music_play_filtera"
	>
<span id="musicControl">
        <a id="mc_play" class="stop" onclick="play_music();">
            <audio id="musicfx" loop="loop" autoplay="autoplay">
                <source src="resource/style/music.mp3" type="audio/mpeg">
            </audio>
        </a>
 </span>
</div>
<div class="box">
	<div class="jz">
		<p><b>抽奖活动</b></p><br />
		<%--<div class="photo"><img id="image" width="200" height="150"src="resource/image/ico.png"/></div>
		<span class="name">姓名</span><br />--%>
		<span class="name">姓名</span><br />
		<span class="phone">编号</span><br />
		<div class="start" id="btntxt" onclick="start()">开始</div>
	</div>
	<div class="zjmd">
		<p class="p1">中奖者名单</p>
		<div class="list">
		</div>
	</div>
</div>
<div class="footer" style="text-align: center"> Copyright &copy; 2017  一特软件开发团队   <a href="/kill">首页</a>	<a href="list.htm">已签到</a>	<a href="cj.htm">未签到</a> <a href="hj.htm">已中奖</a></div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="resource/jquery/jquery.min.js"></script>
<script src="resource/vue/vue.js"></script>
<script src="resource/vue/config.js"></script>
<script src="resource/layer/layer.js"></script>
<script type="text/javascript" src="resource/style/cj.js"></script>

<script>
	function play_music(){
		if ($('#mc_play').hasClass('on')){
			$('#mc_play audio').get(0).pause();
			$('#mc_play').attr('class','stop');
		}else{
			$('#mc_play audio').get(0).play();
			$('#mc_play').attr('class','on');
		}
		$('#music_play_filter').hide();
		event.stopPropagation(); //阻止冒泡
	}
	function just_play(id){
		$('#mc_play audio').get(0).play();
		$('#mc_play').attr('class','on');
		if (typeof(id)!='undefined'){
			$('#music_play_filter').hide();
		}
		event.stopPropagation(); //阻止冒泡
	}
	/*function is_weixn(){
		return false;
		var ua = navigator.userAgent.toLowerCase();
		if(ua.match(/MicroMessenger/i)=="micromessenger") {
			return true;
		} else {
			return false;
		}
	}*/
	var play_filter=document.getElementById('music_play_filter');
	if(play_filter != undefined){
	play_filter.addEventListener('click', function(){
		just_play(1);
	});
	play_filter.addEventListener('touchstart', function(){
		just_play(1);
	});
	play_filter.addEventListener('touchend', function(){
		just_play(1);
	});
	play_filter.addEventListener('touchmove', function(){
		just_play(1);
	});
	play_filter.addEventListener('mousedown', function(){
		just_play(1);
	});
	play_filter.addEventListener('mouseup', function(){
		just_play(1);
	});
	play_filter.addEventListener('mousemove',function(){
		just_play(1);
	});
	}
	window.onload=function(){
		//if (!is_weixn()){
			just_play();
		//}
	}
</script>
</body>
</html>