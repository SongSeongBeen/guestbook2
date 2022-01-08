<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.GuestbookDao" %>    
<%@ page import="com.javaex.vo.GuestbookVo" %>

<%@ page import="java.util.List" %>

<%
	@SuppressWarnings("unchecked")
	List<GuestbookVo> list = (List<GuestbookVo>)request.getAttribute("gList");
%>

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
			<input type="hidden" name="action" value="add">
	</form>
		<!-- 등록 폼영역 -->
		<br>
		<!-- 리스트영역 -->

		<%
		for(GuestbookVo vo : list){
		//for(int i=0; i<guestbookList.size(); i++){	
		%>
		<table border="1"  width="500px">
			<tr>
				<td><%=vo.getNo()%></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getRegDate()%></td>
				<td><a href="/guestbook2/gbc?action=deleteForm&no=<%=vo.getNo()%>&password=<%=vo.getPassword()%>">[삭제]</a></td>
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