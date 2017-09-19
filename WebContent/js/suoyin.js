function sylx123(){
	var sylxqq = document.getElementById("sylx");
	var shlxqq = document.getElementById("shlx");
	if(shlxqq.value == ""){
		document.getElementById("kkk").style.display = "block";
		document.getElementById("shshzt1").style.display = "none";
		document.getElementById("glcs").style.display = "none";
	}
	else if(shlxqq.value == "形式审核"){
		document.getElementById("kkk").style.display = "none";
		document.getElementById("shshzt1").style.display = "block";
		document.getElementById("glcs").style.display = "none";
	}
	else if(shlxqq.value == "部门审核"){
		document.getElementById("kkk").style.display = "none";
		document.getElementById("shshzt1").style.display = "block";
		document.getElementById("glcs").style.display = "block";
	}
	if(sylxqq.value == ""){
		document.getElementById("kong").style.display = "block";
		document.getElementById("gkglbm").style.display = "none";
		document.getElementById("szdy").style.display = "none";
		document.getElementById("jgsx").style.display = "none";
		document.getElementById("jsxujjfs").style.display = "none";
		document.getElementById("kjhdlx").style.display = "none";
	}
	else if(sylxqq.value == "归口管理部门"){
		document.getElementById("kong").style.display = "none";
		document.getElementById("gkglbm").style.display = "block";
		document.getElementById("szdy").style.display = "none";
		document.getElementById("jgsx").style.display = "none";
		document.getElementById("jsxujjfs").style.display = "none";
		document.getElementById("kjhdlx").style.display = "none";
	}
	else if(sylxqq.value == "所在地域"){
		document.getElementById("kong").style.display = "none";
		document.getElementById("gkglbm").style.display = "none";
		document.getElementById("szdy").style.display = "block";
		document.getElementById("jgsx").style.display = "none";
		document.getElementById("jsxujjfs").style.display = "none";
		document.getElementById("kjhdlx").style.display = "none";
	}
	else if(sylxqq.value == "机构属性"){
		document.getElementById("kong").style.display = "none";
		document.getElementById("gkglbm").style.display = "none";
		document.getElementById("szdy").style.display = "none";
		document.getElementById("jgsx").style.display = "block";
		document.getElementById("jsxujjfs").style.display = "none";
		document.getElementById("kjhdlx").style.display = "none";
	}
	else if(sylxqq.value == "技术需求解决方式 "){
		document.getElementById("kong").style.display = "none";
		document.getElementById("gkglbm").style.display = "none";
		document.getElementById("szdy").style.display = "none";
		document.getElementById("jgsx").style.display = "none";
		document.getElementById("jsxujjfs").style.display = "block";
		document.getElementById("kjhdlx").style.display = "none";
	}
	else if(sylxqq.value == "科技活动类型"){
		document.getElementById("kong").style.display = "none";
		document.getElementById("gkglbm").style.display = "none";
		document.getElementById("szdy").style.display = "none";
		document.getElementById("jgsx").style.display = "none";
		document.getElementById("jsxujjfs").style.display = "none";
		document.getElementById("kjhdlx").style.display = "block";
	}
}
/*function shlx123(){
	var shlxqq = document.getElementById("shlx");
	if(sylxqq.value == ""){
		document.getElementById("kkk").style.display = "block";
		document.getElementById("shshzt1").style.display = "none";
	}
	else if(sylxqq.value.trim() == "形式审核"){
		alert(1);
		document.getElementById("kkk").style.display = "none";
		document.getElementById("shshzt1").style.display = "block";
	}
	else if(sylxqq.value == "部门审核"){
		alert(1);
		document.getElementById("kkk").style.display = "none";
		document.getElementById("shshzt1").style.display = "block";
	}
}*/
