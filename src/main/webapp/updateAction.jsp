<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
String UserID=null;

if(session.getAttribute("UserID")!=null) {
	UserID=(String)session.getAttribute("UserID");
}
//로그인 한 사람만 글을 쓸 수 있음
if (UserID==null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 되어있지 않습니다.');");
	script.println("loaction.href='login.jsp';");
	script.println("</script>");
}

int bbsID = 0;
if(request.getParameter("bbsID") != null) {
	bbsID = Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 게시글입니다.');");
	script.println("loaction.href='bbs.jsp';");
	script.println("</script>");
}
//게시글 작성자와 로그인한 유저가 같은지 확인
Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!UserID.equals(bbs.getUserID())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href='bbs.jsp'");
	script.println("</script>");
} else {
	if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null || 
		request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else {
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
		
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정하기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정하기 성공')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
			
		}
	}
}

%>