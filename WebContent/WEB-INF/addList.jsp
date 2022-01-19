<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.List" %>



<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	<!-- 등록 폼영역 -->
	<form action="/guestbook2/gbc" method="get">
		<table border="1" width="500px">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td>
				<td>비밀번호</td>
				<td><input type="password" name="password" value=""></td>
			</tr>
			<tr>
				<td colspan="4"><textarea cols="65" rows="5" name="content"></textarea></td>
			</tr>
		</table>
			<button type="submit">확인</button>
			<td><input type="hidden" name="action" value="add"></td>
	</form>
		<!-- 등록 폼영역 -->
		<br>
		<!-- 리스트영역 -->

		<table border="1"  width="500px">
			<c:forEach items="${gList}" var="vo"  varStatus="status">
				<tr>
					<td>${vo.no}</td>
					<td>${vo.name}</td>
					<td>${vo.regDate}</td>
					<td><a href="/guestbook2/gbc?action=deleteForm&no=${vo.no}">[삭제]</a></td>
				</tr>
				<tr>
					<td colspan="4">
					${vo.content}
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>

		
		<!-- 리스트영역 -->
	
	</body>
</html>