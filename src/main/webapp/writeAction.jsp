<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
String bbsTitle=null;
String bbsContent=null;
String UserID=null;

if(request.getParameter("bbsTitle")!=null) {
	bbsTitle=(String)request.getParameter("bbsTitle");
}

if(request.getParameter("bbsContent")!=null) {
	bbsContent=(String)request.getParameter("bbsContent");
}

if(session.getAttribute("UserID")!=null) {
	UserID=(String)session.getAttribute("UserID");
}

if (UserID==null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 되어있지 않습니다.')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
	script.close();
}else {
	if (bbsTitle==null || bbsContent == null) { //얘 안됨
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}else{
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(bbsTitle, UserID, bbsContent);
		if(result == -1) { //데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 성공')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
			script.close();
		}
	}
}
%>