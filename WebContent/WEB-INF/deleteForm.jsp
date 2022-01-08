<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//int no =  Integer.parseInt(request.getParameter("no")); 쓰일곳만 형변환 해주면된다.
	String no = request.getParameter("no");
%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<br>
		<form action="delete.jsp" method="get">
		        <input  type="hidden" name="no" value="<%= no %>"> 
	         	비밀번호 <input  type="password" name="password" value=""> 
			    <button type="submit"> 확인 </button>
		</form>
		<br>
		<a href="./addList.jsp">메인으로 돌아가기</a>
	</body>
</html>