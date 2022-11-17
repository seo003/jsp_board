<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
h3 { text-align:center; }
#login { float:center; }
table { margin:auto; 
		border:1px solid black;
		border-collapse:collapse;}
td { height:15px; padding:10px;}
#name { width:65px;}
#button { text-align:center; }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인</h3>
<form action="./loginAction.jsp" method="post">
	<table>
	<tr> 
		<td id="name">아이디</td>
		<td><input id="UserID" type="text" value="" size="15" name="UserID"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input id="UserPW" type="password" value="" size="15" name="UserPW"></td>
	</tr>
	<tr>
		<td colspan='2' id="button"><input type="submit" value="로그인"></td>
	</table>
</form>
</body>
</html>