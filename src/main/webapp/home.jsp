<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body { font-family: "맑은 고딕", "고딕", "굴림";}

#DIV { width: 800px; margin: auto; }

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
 
section { width:80%}
section nav ul { list-style-type:none;}
section nav ul li { display: inline; float: left; font-weight: bold; margin: 8px;}
section nav ul li a {color:black; text-decoration: none;}
section nav ul li a:hover { text-decoration:underline; color:gray;}

aside { width:20%; float:right; height:auto; text-align:center;}
aside a img:hover { border : 5px black;}

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
<div id="DIV">
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
<section>
    <nav>
        <ul>
            <li><a href="bbs.jsp">자유게시판</a></li>
            <li>|</li>
            <li><a href="#">추천게시판</a></li>
            <li></li>
            <li><a href="#"></a></li>
        </ul>
    </nav>
</section>
    <br><br>
<aside>
    <h3>웹툰 바로가기</h3>
    <a href="https://comic.naver.com/index" target="_blank">
        <img src="media/naverwebtoon.png" alt="네이버웹툰" width="125px" height="125px">
    </a><br>
    <a href="https://page.kakao.com/" target="_blank">
        <img src="media/kakaopage.png" alt="카카오페이지" width="125px" height="125px">
    </a><br>
    <a href="https://webtoon.kakao.com/" target="_blank">
        <img src="media/kakaowebtoon.png" alt="카카오웹툰" width="125px" height="125px">
    </a>
</aside>
<footer>
    <p>
        <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
    </p>
</footer>
</div>
</body>
</html>