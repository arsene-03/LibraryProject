<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지로 가기</title>
</head>
<body>

<%
//response.sendRedirect("http://15.165.137.195:8090/LibraryProject/LS?command=main");
response.sendRedirect("http://localhost:8090/LibraryProject/LS?command=main");
%>

</body>
</html>