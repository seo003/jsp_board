<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
div table td {}}

#t_left_title {background:lightgray; text-align:center;}
#t_left_user {background:lightgray; text-align:center;}
#t_left_date {background:lightgray; text-align:center;}
#t_left_content {background:lightgray; text-align:center;}
#title { width:720px;}
#user {width:720px;}
#date {width:720px;}
#content {width:720px; height:200px;}

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
%>
<header>
     <nav>
     <%
     	if(UserID==null){
     %>
        <ul>
            <li><a href="login.jsp">SIGN IN</a></li>
            <li>|</li>
            <li><a href="join.jsp">SIGN UP</a></li>
            <li>|</li>
            <li><a href="home.jsp">HOME</a></li>
        </ul>
        <%
     	} else {
        %>
        <ul>
            <li><a href="logoutAction.jsp">LogOut</a></li>
            <li>|</li>
            <li><a href="home.jsp">HOME</a></li>
        </ul>
        <%
     	}
        %>
    </nav>
</header>
    <br><br>
<div>
<form method="post" action="writeAction.jsp">
<table>
	<tr>
		<td id="t_left_title" style="background:lightgray; text-align:center;">제목</td>	
		<td id = "title"><%=bbs.getBbsTitle() %></td>
	</tr>
	<tr>
		<td id="t_left_user">작성자</td>
		<td id = "user"><%=bbs.getUserID() %></td>
	</tr>
	<tr>
		<td id="t_left_date">작성일자</td>
		<td id="date"><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" + bbs.getBbsDate().substring(14,16) + "분" %></td>
	</tr>	
	<tr>
		<td id="t_left_content">내용</td>
		<td id="content"><%=bbs.getBbsContent().replace(" ", "&nbsp;").replace("\n", "<br>") %></td>
	</tr>
</table>
<br>
</form>
<div id="btn">
<a href="bbs.jsp"><input type="button" value="목록"></a>
<% //작성자만 수정, 삭제 뜸
if(UserID != null && UserID.equals(bbs.getUserID())){
%>
<a href="update.jsp?bbsID=<%= bbsID %>"><input type="button" value="수정"></a>
<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>"><input type="button" value="삭제"></a>
<%
}
%>
</div>
</div>
<footer>
    <p>
        <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
    </p>
</footer>
</body>
</html>