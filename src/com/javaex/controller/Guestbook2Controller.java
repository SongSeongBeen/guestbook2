package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.vo.GuestbookVo;



@WebServlet("/gbc")
public class Guestbook2Controller extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("guestbook2Controller");
		
		String act = request.getParameter("action");
		
	//리스트 출력	
		if("addList".equals(act)) {
			System.out.println("action=addList");
			
			List<GuestbookVo> guestbookList = new GuestbookDao().getList();
			
			// 포워드
			request.setAttribute("gList", guestbookList); // 주소만 준거다
			
			// ^^^^^ setAttribute(값입력) ex("pList", personList);
			RequestDispatcher re = request.getRequestDispatcher("/WEB-INF/addList.jsp");
			re.forward(request, response);
			
	//리스트입력-확인		
		}else if("add".equals(act)){
			
			System.out.println("action=add");
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");

			//전송된 값을 Vo객체로 만든다
			GuestbookVo guestbookVo= new GuestbookVo(name, password, content);
			   
			//PhoneDao를 메모리에 올린다.
			GuestbookDao guestbookDao = new GuestbookDao();
			//저장한다.
			guestbookDao.guestInsert(guestbookVo);
			
			response.sendRedirect("gbc?action=addList");
	//삭제폼		
		}else if("deleteForm".equals(act)){
			
			System.out.println("action=deleteForm");
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/deleteForm.jsp");
			rd.forward(request, response);
			
	//삭제입력		
		}else if("delete".equals(act)){
			
			System.out.println("확인용"); 
			
			int no =  Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");
			
			//삭제
			new GuestbookDao().guestbookDelete(no, password);
			
			response.sendRedirect("gbc?action=addList");
			
		}else {
			System.out.println("파라미터값 없음");
		}
		
		
		
	}
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
