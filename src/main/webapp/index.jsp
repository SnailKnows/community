<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

	<head>
		<title>FaustCplus (Flash Avatar Upload Sina Twitter Crack+)</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css" media="screen">
		html, body { height:100%; background-color: #ffffff;}
		#flashContent { width:100%; height:100%; }
		</style>
	</head>

	<body>
		<div id="altContent"></div>
		<div>
			<input type="button" onclick="swfobject.getObjectById('FaustCplus').jscall_updateAvatar();" value="JS Call Upload"/>
		</div>
		<div id="avatar_priview"></div>

		<script type="text/javascript" src="resources/js/swfobject.js"></script>
		<script type="text/javascript">

			function uploadevent(status){
			     status += '';
				 switch(status){

					case '1':
						alert('upload succeed!');
						var time = new Date().getTime();
						document.getElementById('avatar_priview').innerHTML = "Avatar Priview: <img src='php/avatar_1.jpg?" + time + "'/> <br/> Source Image: <img src='php/avatar_2.jpg?" + time + "'/>";
					break;

					case '2':
						if(confirm('js call upload')){
							return 1;
						}else{
							return 0;
						}
					break;

					case '-1':
						alert('cancel!');
						window.location.href = "#";
					break;
					case '-2':
						alert('upload failed!');
						window.location.href = "#";
					break;

					default:
						alert(typeof(status) + ' ' + status);
				} 
			}

			var flashvars = {
			  "jsfunc":"uploadevent",
			  "imgUrl":"test.jpg",
			  "pid":"75642723",
			  "uploadSrc":true,
			  "showBrow":true,
			  "showCame":true,
			  "uploadUrl":"avatar"
			};

			var params = {
				menu: "false",
				scale: "noScale",
				allowFullscreen: "true",
				allowScriptAccess: "always",
				wmode:"transparent",
				bgcolor: "#FFFFFF"
			};

			var attributes = {
				id:"FaustCplus"
			};

			swfobject.embedSWF("resources/FaustCplus-master/FaustCplus.swf", "altContent", "650", "500", "9.0.0", "expressInstall.swf", flashvars, params, attributes);

		</script>

	</body>
</html>