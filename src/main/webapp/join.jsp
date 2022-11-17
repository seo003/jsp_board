<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3 { text-align:center; }
table { margin:auto;
		border:1px solid black;
		border-collapse:collapse; }
td { height:15px; padding:10px; }
#button { text-align:center; }
a {
text-decoration:none; color:black;}
</style>

</head>
<body>
<h3>회원가입</h3>
<form action="./joinAction.jsp" method="post">
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" size="15" name="UserID"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" size="15" name="UserName"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="email" size="15" placeholder="id@host" name="UserEmail"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" size="15" placeholder="-를 제외하고 작성" name="UserPhone" maxlength="11"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" size="15" name="UserPW"></td>
	</tr>
	<tr>
		<td colspan='2'><input type="checkbox" id="check"><a href="#">개인정보 수집 및 이용 동의</a></td>
	</tr>
	<tr>
		<td colspan='2' id="button"><input type="submit" value="회원가입"></td>
	</tr>
	</table>
</form>
</body>
</html>