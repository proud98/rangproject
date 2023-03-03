<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%
	//세션에 저장된 loginok를 읽는다 
	String loginok=(String)session.getAttribute("loginok");
	
	//if 로그아웃 상태면 로그인폼으로 else 로그인 상태면 로그아웃폼으로 
	if(loginok==null){%>
		<jsp:include page="loginform.jsp"/>
	<%}else{%>
		<jsp:include page="logoutform.jsp"/>
	<%}
	
	%>
</body>
</html>