package com.jee.yhservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.common.Database;
import com.jee.xtservlet.CZRZGZ;

public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		Database db = new Database();
		
		//定义变量
		String strUserName = "";//用户名
		String strOrgNeedNum = "";//需求编号
		String strOrgPutunder = "";//归口管理部门
		String strOrgAddress = "";//通讯地址
		String strOrgArea = "";//所在地域
	    String strOrgURL = "";//单位网址
	    String strOrgEmail = "";//电子邮箱
	    String strOrgLaw = "";//法人代表
	    String strOrgContacts = "";//联系人
	    String strOrgFixedPhone = "";//固定电话
	    String strOrgPhone = "";//手机
	    String strOrgPortraiture = "";//传真
	    String strOrgAttribute = "";//机构属性
	    String strOrgIntroduction = "";//机构简介
	    String strOrgTechNeed = "";//技术需求名称
	    String strOrgNeedTime = "";//时限
	    String strOrgNeedTime1 = "";//时限
	    
	    String strOrgScienceNeed = "";//技术需求概述
	    String strOrgScienceNeed1 = "";//技术需求概述
	    String strOrgScienceNeed2 = "";//技术需求概述
	    
	    String strOrgKey = "";//关键字
	    String strOrgKey1 = "";//关键字
	    String strOrgKey2 = "";//关键字
	    String strOrgKey3 = "";//关键字
	    String strOrgKey4 = "";//关键字
	    String strOrgKey5 = "";//关键字
	    
	    String strOrgResearchType = "";//科技活动类型
	    
	    String strOrgSubject = "";//基础研究(学科分类)
	    String strOrgSubject1 = "";//基础研究(学科分类1)
	    String strOrgSubject2 = "";//基础研究(学科分类2)
	    String strOrgSubject3 = "";//基础研究(学科分类3)
	    
	    String strOrgTechWork= "";//非基础研究(需求技术应用行业)
	    String strOrgTechWork1= "";//非基础研究(需求技术应用行业1)
	    String strOrgTechWork2= "";//非基础研究(需求技术应用行业2)
	    String strOrgTechWork3= "";//非基础研究(需求技术应用行业3)
	    
	    String strOrgCooperUnit = "";//合作意向单位
	    String strOrgAllMoney = "";//计划总投资
	    
		strUserName=(String)request.getSession().getAttribute("user_in_session");//*****************得到session中的用户名
		strOrgNeedNum = request.getParameter("OrgNeedNum");//*************************************得到需求编号
	    //System.out.println(strUserName);
		
	    //获取数据
	    strOrgPutunder = request.getParameter("OrgPutunder").trim();//归口管理部门
	    strOrgAddress = request.getParameter("OrgAddress").trim();//通讯地址
	    strOrgArea = request.getParameter("OrgArea").trim();//所在地域
	    strOrgURL = request.getParameter("OrgURL").trim();//单位网址
	    strOrgEmail = request.getParameter("OrgEmail").trim();//电子邮箱
	    strOrgLaw = request.getParameter("OrgLaw").trim();//法人代表
	    strOrgContacts = request.getParameter("OrgContacts").trim();//联系人
	    strOrgFixedPhone = request.getParameter("OrgFixedPhone").trim();//固定电话
	    strOrgPhone = request.getParameter("OrgPhone").trim();//手机
	    strOrgPortraiture = request.getParameter("OrgPortraiture").trim();//传真
	    strOrgAttribute = request.getParameter("OrgAttribute").trim();//机构属性
	    strOrgIntroduction = request.getParameter("OrgIntroduction").trim();//机构简介
	    strOrgTechNeed = request.getParameter("OrgTechNeed").trim();//技术需求名称
	    strOrgNeedTime = request.getParameter("OrgNeedTime").trim();//时限
	    strOrgNeedTime1 = request.getParameter("OrgNeedTime1").trim();//时限
	    
	    strOrgScienceNeed = request.getParameter("OrgScienceNeed").trim();//技术需求概述
	    strOrgScienceNeed1 = request.getParameter("OrgScienceNeed1").trim();//技术需求概述
	    strOrgScienceNeed2 = request.getParameter("OrgScienceNeed2").trim();//技术需求概述
	    
	    strOrgKey1 = request.getParameter("OrgKey1").trim();//关键字1
	    strOrgKey2 = request.getParameter("OrgKey2").trim();//关键字2
	    strOrgKey3 = request.getParameter("OrgKey3").trim();//关键字3
	    strOrgKey4 = request.getParameter("OrgKey4").trim();//关键字4
	    strOrgKey5 = request.getParameter("OrgKey5").trim();//关键字5
	    strOrgKey = strOrgKey1 + "," + strOrgKey2 + "," + strOrgKey3 + "," + strOrgKey4 + "," + strOrgKey5;//关键字
	    if(strOrgKey5==""){
	    	strOrgKey = strOrgKey1 + "," + strOrgKey2 + "," + strOrgKey3 + "," + strOrgKey4;//关键字
	    }
	    if(strOrgKey4==""){
	    	strOrgKey = strOrgKey1 + "," + strOrgKey2 + "," + strOrgKey3;//关键字
	    }
	    if(strOrgKey3==""){
	    	strOrgKey = strOrgKey1 + "," + strOrgKey2;//关键字
	    }
	    if(strOrgKey2==""){
	    	strOrgKey = strOrgKey1;//关键字
	    }
	    
	    strOrgResearchType = request.getParameter("OrgResearchType").trim();//科技活动类型
	    
	    if(request.getParameter("OrgSubject3") != null)
	    {
	    	strOrgSubject1 = request.getParameter("OrgSubject1");//基础研究(学科分类1)
	    	strOrgSubject2 = request.getParameter("OrgSubject2");//基础研究(学科分类2)
	    	strOrgSubject3 = request.getParameter("OrgSubject3");//基础研究(学科分类3)
	    	strOrgSubject = strOrgSubject1 + "," + strOrgSubject2 + "," + strOrgSubject3;//基础研究(学科分类)
	    }
	    else if(request.getParameter("OrgSubject2") != null)
	    {
	    	strOrgSubject1 = request.getParameter("OrgSubject1");//基础研究(学科分类1)
	    	strOrgSubject2 = request.getParameter("OrgSubject2");//基础研究(学科分类2)
	    	strOrgSubject = strOrgSubject1 + "," + strOrgSubject2;//基础研究(学科分类)
	    }
	    else if(request.getParameter("OrgSubject1") != null)
	    {
	    	strOrgSubject1 = request.getParameter("OrgSubject1");//基础研究(学科分类1)
	    	strOrgSubject = strOrgSubject1;//基础研究(学科分类)
	    }
	    
	    String strOrgTechArea = "";//非基础研究(需求技术所属领域)多选项
	    String[] str = request.getParameterValues("OrgTechArea");//非基础研究(需求技术所属领域)***************多选框
		String strOrgOtherTech = "";//非基础研究(其他技术)
	    strOrgOtherTech = request.getParameter("OrgOtherTech").trim();//非基础研究(其他技术)
		if(!("基础研究".equals(strOrgResearchType)))
		{
			for(int i=0; i<str.length; i++)
			{
				strOrgTechArea=strOrgTechArea+str[i]+",";
			}
			strOrgTechArea = strOrgTechArea + "," + strOrgOtherTech;
		}
		else
		{
			strOrgTechArea = "";
		}
	    	
		if(request.getParameter("OrgTechWork3") != null)
	    {
	    	strOrgTechWork1= request.getParameter("OrgTechWork1").trim();//非基础研究(需求技术应用行业1)
		    strOrgTechWork2= request.getParameter("OrgTechWork2").trim();//非基础研究(需求技术应用行业2)
		    strOrgTechWork3= request.getParameter("OrgTechWork3").trim();//非基础研究(需求技术应用行业3)
		    strOrgTechWork = strOrgTechWork1 + "," + strOrgTechWork2 + "," + strOrgTechWork3;//非基础研究(需求技术应用行业)
	    }
		else if(request.getParameter("OrgTechWork2") != null)
	    {
	    	strOrgTechWork1= request.getParameter("OrgTechWork1").trim();//非基础研究(需求技术应用行业1)
		    strOrgTechWork2= request.getParameter("OrgTechWork2").trim();//非基础研究(需求技术应用行业2)
		    strOrgTechWork = strOrgTechWork1 + "," + strOrgTechWork2;//非基础研究(需求技术应用行业)
	    }
		else if(request.getParameter("OrgTechWork1") != null)
	    {
	    	strOrgTechWork1= request.getParameter("OrgTechWork1").trim();//非基础研究(需求技术应用行业1)
		    strOrgTechWork = strOrgTechWork1;//非基础研究(需求技术应用行业)
	    }
	    
	    strOrgCooperUnit = request.getParameter("OrgCooperUnit").trim();//合作意向单位
	    strOrgAllMoney = request.getParameter("OrgAllMoney").trim();//计划总投资
		
		String strOrgCooperation = "";//技术需求解决方式----------单选
		strOrgCooperation = request.getParameter("OrgCooperation");//技术需求解决方式----------单选
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "征集表";
		cz.CZMing = "提交征集表";
		cz.CZYuan = strUserName;
		cz.CZTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String czSql = "insert into CaoZuoJiLu values('"+cz.CZMoKuai+"','"+cz.CZMing+"','"+cz.CZYuan+"','"+cz.CZTime+"'";
		
		String strSql = ""; 
		strSql = "insert into OrgInformation values('"+strUserName+"','"+strOrgNeedNum+"','"+strOrgPutunder+
				"','"+strOrgAddress+"','"+strOrgArea+"','"+strOrgURL+"','"+strOrgEmail+"','"+strOrgLaw+
				"','"+strOrgContacts+"','"+strOrgFixedPhone+"','"+strOrgPhone+"','"+strOrgPortraiture+
				"','"+strOrgAttribute+"','"+strOrgIntroduction+"','"+strOrgTechNeed+"','"+strOrgNeedTime+
				"','"+strOrgNeedTime1+"','"+strOrgScienceNeed+"','"+strOrgScienceNeed1+"','"+strOrgScienceNeed2+
				"','"+strOrgKey+"','"+strOrgResearchType+"','"+strOrgSubject+"','"+strOrgTechArea+
				"','"+strOrgTechWork+"','"+strOrgCooperation+"','"+strOrgCooperUnit+"','"+strOrgAllMoney+"')";
		String strSql1 = ""; 
		strSql1 = "insert into XSSH values('"+strUserName+"','"+strOrgNeedNum+"','"+strOrgTechNeed+"','未审核','')";
		String strSql2 = ""; 
		strSql2 = "insert into BMSH values('"+strUserName+"','"+strOrgNeedNum+"','"+strOrgTechNeed+"','','未审核','')";
		int i = 0;
		i = db.executeUpdate(strSql);
		//System.out.println(strSql);
		int j = 0; 
		j = db.executeUpdate(strSql1);
		//System.out.println(strSql1);
		int k = 0;
		k = db.executeUpdate(strSql2);
		//System.out.println(strSql2);
		try{
			if(i!=1||j!=1||k!=1)
			{
				czSql += ",'失败','需求征集表填写有误')";
				db.executeUpdate(czSql);
		        request.setAttribute("msg","需求征集表填写有误!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templete/table.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			czSql += ",'成功','保存并提交成功')";
			db.executeUpdate(czSql);
			db.close();
			PrintWriter out = response.getWriter();//对象,输出流
			out.print("<script>alert('保存并提交成功!');window.location.href='templete/mywj.jsp'</script>");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
