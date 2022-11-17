<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<td>제목</td>	
		<td><input id="title" type="text" name="bbsTitle"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea id="content" name="bbsContent" maxlength="2048"></textarea></td>
	</tr>
</table>
<br>
<div id="btn"> <input type="submit" value="글쓰기"> </div>
</form>
</div>
<footer>
    <p>
        <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
    </p>
</footer>
</body>
</html>