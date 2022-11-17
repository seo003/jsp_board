<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.userDAO"%>
<%@ page import="user.userDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
String UserID=null;
String UserName=null;
String UserEmail=null;
String UserPhone=null;
String UserPW=null;

if(request.getParameter("UserID")!=null) { //getElementBy같은느낌
	UserID=(String)request.getParameter("UserID");
}

if(request.getParameter("UserName")!=null) {
	UserName=(String)request.getParameter("UserName");
}

if(request.getParameter("UserEmail")!=null) {
	UserEmail=(String)request.getParameter("UserEmail");
}

if(request.getParameter("UserPhone")!=null) {
	UserPhone=(String)request.getParameter("UserPhone");
}

if(request.getParameter("UserPW")!=null) {
	UserPW=(String)request.getParameter("UserPW");
}

if (UserID==null || UserName==null || UserEmail==null || UserPhone==null || UserPW==null) { //얘 안됨
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

userDAO userDAO = new userDAO();
int result = userDAO.join(UserID, UserName, UserEmail, UserPhone, UserPW);
if (result == 1) {
	session.setAttribute("UserID",UserID);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입에 성공했습니다.');");
	script.println("location.href='home.jsp';");
	script.println("</script>");
	script.close();
	return;
}
else if (result==-1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.print("alert('데이터베이스오류");
	script.print(UserID + "/" + UserName + "/" + UserEmail + "/" + UserPhone + "/" + UserPW);
	script.println("');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>