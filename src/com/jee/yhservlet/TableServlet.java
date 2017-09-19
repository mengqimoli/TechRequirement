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
		
		//�������
		String strUserName = "";//�û���
		String strOrgNeedNum = "";//������
		String strOrgPutunder = "";//��ڹ�����
		String strOrgAddress = "";//ͨѶ��ַ
		String strOrgArea = "";//���ڵ���
	    String strOrgURL = "";//��λ��ַ
	    String strOrgEmail = "";//��������
	    String strOrgLaw = "";//���˴���
	    String strOrgContacts = "";//��ϵ��
	    String strOrgFixedPhone = "";//�̶��绰
	    String strOrgPhone = "";//�ֻ�
	    String strOrgPortraiture = "";//����
	    String strOrgAttribute = "";//��������
	    String strOrgIntroduction = "";//�������
	    String strOrgTechNeed = "";//������������
	    String strOrgNeedTime = "";//ʱ��
	    String strOrgNeedTime1 = "";//ʱ��
	    
	    String strOrgScienceNeed = "";//�����������
	    String strOrgScienceNeed1 = "";//�����������
	    String strOrgScienceNeed2 = "";//�����������
	    
	    String strOrgKey = "";//�ؼ���
	    String strOrgKey1 = "";//�ؼ���
	    String strOrgKey2 = "";//�ؼ���
	    String strOrgKey3 = "";//�ؼ���
	    String strOrgKey4 = "";//�ؼ���
	    String strOrgKey5 = "";//�ؼ���
	    
	    String strOrgResearchType = "";//�Ƽ������
	    
	    String strOrgSubject = "";//�����о�(ѧ�Ʒ���)
	    String strOrgSubject1 = "";//�����о�(ѧ�Ʒ���1)
	    String strOrgSubject2 = "";//�����о�(ѧ�Ʒ���2)
	    String strOrgSubject3 = "";//�����о�(ѧ�Ʒ���3)
	    
	    String strOrgTechWork= "";//�ǻ����о�(������Ӧ����ҵ)
	    String strOrgTechWork1= "";//�ǻ����о�(������Ӧ����ҵ1)
	    String strOrgTechWork2= "";//�ǻ����о�(������Ӧ����ҵ2)
	    String strOrgTechWork3= "";//�ǻ����о�(������Ӧ����ҵ3)
	    
	    String strOrgCooperUnit = "";//��������λ
	    String strOrgAllMoney = "";//�ƻ���Ͷ��
	    
		strUserName=(String)request.getSession().getAttribute("user_in_session");//*****************�õ�session�е��û���
		strOrgNeedNum = request.getParameter("OrgNeedNum");//*************************************�õ�������
	    //System.out.println(strUserName);
		
	    //��ȡ����
	    strOrgPutunder = request.getParameter("OrgPutunder").trim();//��ڹ�����
	    strOrgAddress = request.getParameter("OrgAddress").trim();//ͨѶ��ַ
	    strOrgArea = request.getParameter("OrgArea").trim();//���ڵ���
	    strOrgURL = request.getParameter("OrgURL").trim();//��λ��ַ
	    strOrgEmail = request.getParameter("OrgEmail").trim();//��������
	    strOrgLaw = request.getParameter("OrgLaw").trim();//���˴���
	    strOrgContacts = request.getParameter("OrgContacts").trim();//��ϵ��
	    strOrgFixedPhone = request.getParameter("OrgFixedPhone").trim();//�̶��绰
	    strOrgPhone = request.getParameter("OrgPhone").trim();//�ֻ�
	    strOrgPortraiture = request.getParameter("OrgPortraiture").trim();//����
	    strOrgAttribute = request.getParameter("OrgAttribute").trim();//��������
	    strOrgIntroduction = request.getParameter("OrgIntroduction").trim();//�������
	    strOrgTechNeed = request.getParameter("OrgTechNeed").trim();//������������
	    strOrgNeedTime = request.getParameter("OrgNeedTime").trim();//ʱ��
	    strOrgNeedTime1 = request.getParameter("OrgNeedTime1").trim();//ʱ��
	    
	    strOrgScienceNeed = request.getParameter("OrgScienceNeed").trim();//�����������
	    strOrgScienceNeed1 = request.getParameter("OrgScienceNeed1").trim();//�����������
	    strOrgScienceNeed2 = request.getParameter("OrgScienceNeed2").trim();//�����������
	    
	    strOrgKey1 = request.getParameter("OrgKey1").trim();//�ؼ���1
	    strOrgKey2 = request.getParameter("OrgKey2").trim();//�ؼ���2
	    strOrgKey3 = request.getParameter("OrgKey3").trim();//�ؼ���3
	    strOrgKey4 = request.getParameter("OrgKey4").trim();//�ؼ���4
	    strOrgKey5 = request.getParameter("OrgKey5").trim();//�ؼ���5
	    strOrgKey = strOrgKey1 + "," + strOrgKey2 + "," + strOrgKey3 + "," + strOrgKey4 + "," + strOrgKey5;//�ؼ���
	    if(strOrgKey5==""){
	    	strOrgKey = strOrgKey1 + "," + strOrgKey2 + "," + strOrgKey3 + "," + strOrgKey4;//�ؼ���
	    }
	    if(strOrgKey4==""){
	    	strOrgKey = strOrgKey1 + "," + strOrgKey2 + "," + strOrgKey3;//�ؼ���
	    }
	    if(strOrgKey3==""){
	    	strOrgKey = strOrgKey1 + "," + strOrgKey2;//�ؼ���
	    }
	    if(strOrgKey2==""){
	    	strOrgKey = strOrgKey1;//�ؼ���
	    }
	    
	    strOrgResearchType = request.getParameter("OrgResearchType").trim();//�Ƽ������
	    
	    if(request.getParameter("OrgSubject3") != null)
	    {
	    	strOrgSubject1 = request.getParameter("OrgSubject1");//�����о�(ѧ�Ʒ���1)
	    	strOrgSubject2 = request.getParameter("OrgSubject2");//�����о�(ѧ�Ʒ���2)
	    	strOrgSubject3 = request.getParameter("OrgSubject3");//�����о�(ѧ�Ʒ���3)
	    	strOrgSubject = strOrgSubject1 + "," + strOrgSubject2 + "," + strOrgSubject3;//�����о�(ѧ�Ʒ���)
	    }
	    else if(request.getParameter("OrgSubject2") != null)
	    {
	    	strOrgSubject1 = request.getParameter("OrgSubject1");//�����о�(ѧ�Ʒ���1)
	    	strOrgSubject2 = request.getParameter("OrgSubject2");//�����о�(ѧ�Ʒ���2)
	    	strOrgSubject = strOrgSubject1 + "," + strOrgSubject2;//�����о�(ѧ�Ʒ���)
	    }
	    else if(request.getParameter("OrgSubject1") != null)
	    {
	    	strOrgSubject1 = request.getParameter("OrgSubject1");//�����о�(ѧ�Ʒ���1)
	    	strOrgSubject = strOrgSubject1;//�����о�(ѧ�Ʒ���)
	    }
	    
	    String strOrgTechArea = "";//�ǻ����о�(��������������)��ѡ��
	    String[] str = request.getParameterValues("OrgTechArea");//�ǻ����о�(��������������)***************��ѡ��
		String strOrgOtherTech = "";//�ǻ����о�(��������)
	    strOrgOtherTech = request.getParameter("OrgOtherTech").trim();//�ǻ����о�(��������)
		if(!("�����о�".equals(strOrgResearchType)))
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
	    	strOrgTechWork1= request.getParameter("OrgTechWork1").trim();//�ǻ����о�(������Ӧ����ҵ1)
		    strOrgTechWork2= request.getParameter("OrgTechWork2").trim();//�ǻ����о�(������Ӧ����ҵ2)
		    strOrgTechWork3= request.getParameter("OrgTechWork3").trim();//�ǻ����о�(������Ӧ����ҵ3)
		    strOrgTechWork = strOrgTechWork1 + "," + strOrgTechWork2 + "," + strOrgTechWork3;//�ǻ����о�(������Ӧ����ҵ)
	    }
		else if(request.getParameter("OrgTechWork2") != null)
	    {
	    	strOrgTechWork1= request.getParameter("OrgTechWork1").trim();//�ǻ����о�(������Ӧ����ҵ1)
		    strOrgTechWork2= request.getParameter("OrgTechWork2").trim();//�ǻ����о�(������Ӧ����ҵ2)
		    strOrgTechWork = strOrgTechWork1 + "," + strOrgTechWork2;//�ǻ����о�(������Ӧ����ҵ)
	    }
		else if(request.getParameter("OrgTechWork1") != null)
	    {
	    	strOrgTechWork1= request.getParameter("OrgTechWork1").trim();//�ǻ����о�(������Ӧ����ҵ1)
		    strOrgTechWork = strOrgTechWork1;//�ǻ����о�(������Ӧ����ҵ)
	    }
	    
	    strOrgCooperUnit = request.getParameter("OrgCooperUnit").trim();//��������λ
	    strOrgAllMoney = request.getParameter("OrgAllMoney").trim();//�ƻ���Ͷ��
		
		String strOrgCooperation = "";//������������ʽ----------��ѡ
		strOrgCooperation = request.getParameter("OrgCooperation");//������������ʽ----------��ѡ
		
		CZRZGZ cz = new CZRZGZ();
		cz.CZMoKuai = "������";
		cz.CZMing = "�ύ������";
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
		strSql1 = "insert into XSSH values('"+strUserName+"','"+strOrgNeedNum+"','"+strOrgTechNeed+"','δ���','')";
		String strSql2 = ""; 
		strSql2 = "insert into BMSH values('"+strUserName+"','"+strOrgNeedNum+"','"+strOrgTechNeed+"','','δ���','')";
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
				czSql += ",'ʧ��','������������д����')";
				db.executeUpdate(czSql);
		        request.setAttribute("msg","������������д����!");
		        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templete/table.jsp");
		        requestDispatcher.forward(request,response);
		        return;
			}
			czSql += ",'�ɹ�','���沢�ύ�ɹ�')";
			db.executeUpdate(czSql);
			db.close();
			PrintWriter out = response.getWriter();//����,�����
			out.print("<script>alert('���沢�ύ�ɹ�!');window.location.href='templete/mywj.jsp'</script>");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
