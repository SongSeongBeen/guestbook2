<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.GuestbookDao" %>    
<%@ page import="com.javaex.vo.GuestbookVo" %>

<%@ page import="java.util.List" %>

<%
	GuestbookDao guestbookDao = new GuestbookDao();
	List<GuestbookVo> guestbookList = guestbookDao.getList();
%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	<!-- 등록 폼영역 -->
	<form action="/guestbook2/add" method="get">
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
			<tr>
				<td><input type="hidden" name="action" value="add"></td>
				<td colspan="4"><button type="submit">확인</button></td>
			</tr>
		</table>
	</form>
		<!-- 등록 폼영역 -->
		<br>
		<!-- 리스트영역 -->

		<%
		for(GuestbookVo vo : guestbookList){
		//for(int i=0; i<guestbookList.size(); i++){	
		%>
		<table border="1"  width="500px">
			<tr>
				<td><%=vo.getNo()%></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getRegDate()%></td>
				<td><a href="./deleteForm.jsp?no=<%=vo.getNo()%>&password=<%=vo.getPassword()%>">[삭제]</a></td>
			</tr>
			<tr>
				<td colspan="4">
				<%=vo.getContent() %>
				</td>
			</tr>
		</table>
		<br>
		<%}%>
		
		<!-- 리스트영역 -->
	
	</body>
</html>