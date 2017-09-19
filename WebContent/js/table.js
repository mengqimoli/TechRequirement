/* ***************************************************************************************判断输入为空 */
	function Check1()
	{
		var d = new Date();
        var nowYear = +d.getFullYear();
        var strReg=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        var wz = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
		
        var OrgAddress=document.getElementById("OrgAddress").value.trim();
        var OrgURL=document.getElementById("OrgURL").value.trim();
		var OrgEmail=document.getElementById("OrgEmail").value.trim();
		var OrgPutunder=document.getElementById("OrgPutunder").value.trim();
		var OrgLaw=document.getElementById("OrgLaw").value.trim();
		var OrgContacts=document.getElementById("OrgContacts").value.trim();
		var OrgPhone=document.getElementById("OrgPhone").value.trim();
		var OrgIntroduction=document.getElementById("OrgIntroduction").value.trim();
		var OrgTechNeed=document.getElementById("OrgTechNeed").value.trim();
		var OrgNeedTime=document.getElementById("OrgNeedTime").value.trim();
		var OrgNeedTime1=document.getElementById("OrgNeedTime1").value.trim();
		var OrgScienceNeed=document.getElementById("OrgScienceNeed").value.trim();
		var OrgScienceNeed1=document.getElementById("OrgScienceNeed1").value.trim();
		var OrgScienceNeed2=document.getElementById("OrgScienceNeed2").value.trim();
		var OrgKey1=document.getElementById("OrgKey1").value.trim();
		var OrgEmail=document.getElementById("OrgEmail").value.trim();//邮箱是否正确
		var r = OrgEmail.search(strReg); 
		var OrgSubject1 = document.getElementById("OrgSubject1").value.trim();
		var q = document.getElementById("q");
		var OrgTechWork1 = document.getElementById("OrgTechWork1").value.trim();
		var OrgTechArea = document.getElementsByName("OrgTechArea");
		var len = OrgTechArea.length; 
		var flag = 0;
		
		if(q.checked){
			if(OrgSubject1 == ""){
				alert("学科分类不能为空");
				return false;
			}
		}
		if(!q.checked)
		{
			for(var i=0; i<len	; i++)
			{
				if(OrgTechArea[i].checked)
				{
					flag = 1 ;
                    break;
                }
			}
			if(flag == 0){
				alert("请最少选择一项需求技术所属领域");
                return false ;
			}
			if(OrgTechWork1 == ""){
				alert("需求技术应用行业不能为空");
				return false;
			}
		}
		 
		if(OrgAddress=="")
		{
			alert("通讯地址不能为空");
			return false;
		}
		/*else if(OrgURL!="")
		{
			if(wz.test(OrgURL)==false){
				alert("请输入正确的网址");
				return false;
			}
		}*/
		else if(r==-1)
		{
			alert("电子信箱格式错误");
			return false;
		}
		else if(OrgLaw=="")
		{
			alert("法人代表不能为空，没有可写“无”");
			return false;
		}
		else if(OrgContacts=="")
		{
			alert("联系人不能为空，没有可写“无”");
			return false;
		}
		else if(OrgPhone.length!=11)
		{
			alert("请输入正确的手机格式");
			return false;
		}
		else if(OrgIntroduction=="")
		{
			alert("机构简介不能为空");
			return false;
		}
		else if(OrgTechNeed=="")
		{
			alert("技术需求名称不能为空");
			return false;
		}
		else if(OrgNeedTime<=nowYear)
		{
			alert("起始需求时限不能低于当前年份");
			return false;
		}
		else if(OrgNeedTime>=OrgNeedTime1)
		{
			alert("结束需求时限不能低于起始需求时限");
			return false;
		}
		else if(OrgScienceNeed==""||OrgScienceNeed1==""||OrgScienceNeed2=="")
		{
			alert("三个需求技术概述不能为空，没有可写“无”");
			return false;
		}
		else if(OrgKey1=="")
		{
			alert("关键字不能为空，没有可写“无”");
			return false;
		}
		else
		{
			var sure = confirm("需求信息审核后不能修改！ 确定提交吗?");
			if(sure == true){
				return true;
			}else{
				return false;
			}
		}
	}
/* ********************************************************************************************实时显示字数 */
	function Introduction()
	{
		var maxl = 500;
		var count1=0;
		var textIIntro=document.getElementById("OrgIntroduction").value;
		var lenIIntro=textIIntro.length;
		for(var i=0;i<lenIIntro;i++)
		{
			var enter1=textIIntro.substr(i,1);
			if(enter1=="\n")
			{
				count1++;
			}
		}
		lenIIntro-=count1;
		var showIIntro=lenIIntro;
		if(showIIntro > maxl){
			document.getElementById("OrgIntroduction").value = document.getElementById("OrgIntroduction").value.substr(0,maxl-1);
		}
		document.getElementById("OrgIntroduction1").innerHTML = showIIntro;
	}
	function ScienceNeed()
	{
		var maxl = 500;
		var count1=0;
		var textIIntro=document.getElementById("OrgScienceNeed").value;
		var lenIIntro=textIIntro.length;
		for(var i=0;i<lenIIntro;i++)
		{
			var enter1=textIIntro.substr(i,1);
			if(enter1=="\n")
			{
				count1++;
			}
		}
		lenIIntro-=count1;
		var showIIntro=lenIIntro;
		if(showIIntro > maxl){
			document.getElementById("OrgScienceNeed").value = document.getElementById("OrgScienceNeed").value.substr(0,maxl-1);
		}
		document.getElementById("OrgScienceNeed00").innerHTML = showIIntro;
	}
	function ScienceNeed1()
	{
		var maxl = 500;
		var count1=0;
		var textIIntro=document.getElementById("OrgScienceNeed1").value;
		var lenIIntro=textIIntro.length;
		for(var i=0;i<lenIIntro;i++)
		{
			var enter1=textIIntro.substr(i,1);
			if(enter1=="\n")
			{
				count1++;
			}
		}
		lenIIntro-=count1;
		var showIIntro=lenIIntro;
		if(showIIntro > maxl){
			document.getElementById("OrgScienceNeed1").value = document.getElementById("OrgScienceNeed1").value.substr(0,maxl-1);
		}
		document.getElementById("OrgScienceNeed11").innerHTML = showIIntro;
	}
	function ScienceNeed2()
	{
		var maxl = 500;
		var count1=0;
		var textIIntro=document.getElementById("OrgScienceNeed2").value;
		var lenIIntro=textIIntro.length;
		for(var i=0;i<lenIIntro;i++)
		{
			var enter1=textIIntro.substr(i,1);
			if(enter1=="\n")
			{
				count1++;
			}
		}
		lenIIntro-=count1;
		var showIIntro=lenIIntro;
		if(showIIntro > maxl){
			document.getElementById("OrgScienceNeed2").value = document.getElementById("OrgScienceNeed2").value.substr(0,maxl-1);
		}
		document.getElementById("OrgScienceNeed22").innerHTML = showIIntro;
	}

/* ***************************************************************************************基础研究和非基础研究 */
	function baseSur()
	{
		if(document.getElementById("q").checked)
		{
			document.getElementById("q1").style.display = "table-row"; 
			document.getElementById("w1").style.display = "none"; 
			document.getElementById("w2").style.display = "none"; 
		}
		else if(document.getElementById("w").checked||document.getElementById("e").checked||document.getElementById("r").checked||document.getElementById("t").checked||document.getElementById("y").checked)
		{
			document.getElementById("w1").style.display = "table-row"; 
			document.getElementById("w2").style.display = "table-row"; 
			document.getElementById("q1").style.display = "none"; 
		}
	}
	function otherTech()
	{
		if(document.getElementById("otherTe").checked)
		{
			document.getElementById("otherTe1").style.display = "block"
		}
		else
		{
			document.getElementById("otherTe1").style.display = "none"
		}
	}
	/* ******************************************************************************************合作开发 */
	function dlhz()
	{
		var dlkf = document.getElementById("dlkf");
		var tykf = document.getElementById("tykf");
		var hzkf = document.getElementById("hzkf");
		var qtkf = document.getElementById("qtkf");
		var OrgCooperUnit = document.getElementById("OrgCooperUnit");
		if(dlkf.checked){
			OrgCooperUnit.readOnly = true;
			OrgCooperUnit.style.backgroundColor = "LightGrey";
		}else if(tykf.checked){
			OrgCooperUnit.readOnly = true;
			OrgCooperUnit.style.backgroundColor = "LightGrey";
		}else if(hzkf.checked){
			OrgCooperUnit.readOnly = false;
			OrgCooperUnit.style.backgroundColor = "White";
		}else if(qtkf.checked){
			OrgCooperUnit.readOnly = true;
			OrgCooperUnit.style.backgroundColor = "LightGrey";
		}
	}
	/* *************************************************************************************五个关键字逐个输入 */
	function key1()
	{
		var OrgKey1 = document.getElementById("OrgKey1").value;
		
		if(OrgKey1 != "") {
			document.getElementById("OrgKey2").readOnly = false;
			document.getElementById("OrgKey2").style.backgroundColor = "White";
		} else {
			document.getElementById("OrgKey2").value = "";
			document.getElementById("OrgKey2").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey2").readOnly = true;
			document.getElementById("OrgKey3").value = "";
			document.getElementById("OrgKey3").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey3").readOnly = true;
			document.getElementById("OrgKey4").value = "";
			document.getElementById("OrgKey4").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey4").readOnly = true;
			document.getElementById("OrgKey5").value = "";
			document.getElementById("OrgKey5").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey5").readOnly = true;
		}
	}
	function key2()
	{
		var OrgKey2 = document.getElementById("OrgKey2").value;
		
		if(OrgKey2 != "") {
			document.getElementById("OrgKey3").readOnly = false;
			document.getElementById("OrgKey3").style.backgroundColor = "White";
		} else {
			document.getElementById("OrgKey3").value = "";
			document.getElementById("OrgKey3").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey3").readOnly = true;
			document.getElementById("OrgKey4").value = "";
			document.getElementById("OrgKey4").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey4").readOnly = true;
			document.getElementById("OrgKey5").value = "";
			document.getElementById("OrgKey5").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey5").readOnly = true;
		}
	}
	function key3()
	{
		var OrgKey3 = document.getElementById("OrgKey3").value;
		
		if(OrgKey3 != "") {
			document.getElementById("OrgKey4").readOnly = false;
			document.getElementById("OrgKey4").style.backgroundColor = "White";
		} else {
			document.getElementById("OrgKey4").value = "";
			document.getElementById("OrgKey4").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey4").readOnly = true;
			document.getElementById("OrgKey5").value = "";
			document.getElementById("OrgKey5").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey5").readOnly = true;
		}
	}
	function key4()
	{
		var OrgKey4 = document.getElementById("OrgKey4").value;
		
		if(OrgKey4 != "") {
			document.getElementById("OrgKey5").readOnly = false;
			document.getElementById("OrgKey5").style.backgroundColor = "White";
		} else {
			document.getElementById("OrgKey5").value = "";
			document.getElementById("OrgKey5").style.backgroundColor = "LightGrey";
			document.getElementById("OrgKey5").readOnly = true;
		}
	}
	