<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body { font-family: "맑은 고딕", "고딕", "굴림"; width: 800px; margin: auto;}

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

div table { border: 1px solid black; border-collapse: collapse; text-align:center;}
div table thead { background:lightgray;}
div table tr,th{ border: 1px solid black; height:25px;}
 
thead { border-bottom : 2px solid black;}
tbody { border-bottom: 1px solid lightgray;}
 
#title { width:450px;}
#who { width:50px;}
#date { width:200px;}
#num {width:1%;}
#ahref { text-decoration:none; color:black;}

.write_btn {text-align:center;}

.pagenum { text-decoration:none; color:black; font-szie:50px;}

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
int pageNumber = 1;
if(request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
<section>
    <nav>
        <ul>
            <li><a href="#">자유게시판</a></li>
            <li>|</li>
            <li><a href="#">추천게시판</a></li>
            <li></li>
            <li><a href="#"></a></li>
        </ul>
    </nav>
</section>
    <br><br>
<div>
    <table>
        <thead>
            <tr>
                <th colspan="2" id="title">제목</th>
                <th id="who">작성자</th>
                <th id="date">날짜</th>
                <th id="like">좋아요</th>
            </tr>
        </thead>
        <tbody>
        <%
        BbsDAO bbsDAO = new BbsDAO();
        ArrayList<Bbs> list= bbsDAO.getList(pageNumber);
        for(int i=0; i<list.size(); i++) {
        %>
            <tr>
                <td><%= list.get(i).getBbsID() %></td>
                <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>" id="ahref"><%= list.get(i).getBbsTitle() %></a></td>
                <td><%= list.get(i).getUserID() %></td>
                <td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분"%></td>
                <td><%= list.get(i).getLikeCount() %></td>
            </tr>
            <%
        		}
            %>
        </tbody>
    </table>
    <%
    if(pageNumber != 1) {
    %>
    <a href="bbs.jsp?pageNumber=<%= pageNumber -1 %>" class="pagenum"><</a>
    <%
    } if(bbsDAO.nextPage(pageNumber + 1)) {
    %>
    <a href="bbs.jsp?pageNumber=<%= pageNumber +1 %>" class="pagenum">></a>
    <%
    }
    %>
    <div class="write_btn">
    <a href="write.jsp"><input type="button" value="글쓰기"></a>
    </div>
</div>
<footer>
    <p>
        <a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
    </p>
</footer>
</body>
</html>