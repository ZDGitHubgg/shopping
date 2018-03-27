var i = 1;
			 window.onload = function(){
			 	//定时器：setTimeout  setInterval(循环)
			 	setInterval(gbt,1000);
			 }
			//滚动图
			 function gbt(){
			 	var gbtimg = document.getElementById("gbtimg");
			 	gbtimg.src = "images/img/b"+i+".jpg";
			 	i++;
			 	if(i==3){i=1;}
			 }