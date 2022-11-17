<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body { font-family: "맑은 고딕", "고딕", "굴림"; width:800px; margin:auto;}

p { line-height: 20px; font-size: 12px;}

header { width: 100%; height: 150px; 
         background-image: url(media/제목.jpg); 
         background-repeat: no-repeat;
         background-position: right center;}
header h1 { font-size:3em;}
header nav { float: right; width:40%;  }
header nav ul { list-style-type: none;}
header nav ul li { display: inline; float: left; font-weight: bold; margin: 8px;}
header nav ul li a {color:black; text-decoration: none;}
header nav ul li a:hover { text-decoration:underline; color:green;}

div table { border: 1px solid black; border-collapse: collapse;}
div table thead { background:lightgray;}
div table tr,th{ border: 1px solid black; height:25px;}

#content { width:745px;}
#title { width:745px;}
textarea { height:350px; width:750px;}
#btn { text-align:center;}

footer { clear: both; width: 800px; margin-bottom: 1px; 
        background-color: #333; color: white; text-align: center;}
footer p { padding : 20px; }
footer p a {color:white; text-decoration:none;}
footer p a:hover { text-decoration:underline; color:gray}
</style>
</head>
<body>
<%
String UserID = null;
if(session.getAttribute("UserID")!=null) {
	UserID=(String)session.getAttribute("UserID");
}
if(UserID == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
}
int bbsID = 0;
if(request.getParameter("bbsID") != null) {
	bbsID = Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID == 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글입니다.')");
	script.println("location.href='bbs.jsp'");
	script.println("</script>");
}

Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!UserID.equals(bbs.getUserID())) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href='bbs.jsp'");
	script.println("</script>");
}
%>
<header>
     <nav>
        <ul>
            <li><a href="logoutAction.jsp">LogOut</a></li>
            <li>|</li>
            <li><a href="home.jsp">HOME</a></li>
        </ul>
    </nav>
</header>
    <br><br>
<div>
<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
<table>
	<tr>
		<td>제목</td>	
		<td><input id="title" type="text" name="bbsTitle" value="<%=bbs.getBbsTitle() %>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea id="content" name="bbsContent" maxlength="2048"><%=bbs.getBbsContent() %></textarea></td>
	</tr>
</table>
<br>
<div id="btn"> <input type="submit" value="수정하기"> </div>
</form>
</div>
<footer>
    <p>
        <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
    </p>
</footer>
</body>
</html>