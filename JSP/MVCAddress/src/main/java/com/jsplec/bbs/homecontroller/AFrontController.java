package com.jsplec.bbs.homecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.bbs.command.ACommand;
import com.jsplec.bbs.command.AContentCommand;
import com.jsplec.bbs.command.ADeleteCommand;
import com.jsplec.bbs.command.AListCommand;
import com.jsplec.bbs.command.AModifyCommand;
import com.jsplec.bbs.command.AWriteCommand;

/**
 * Servlet implementation class AFrontController
 */
@WebServlet("*.do")
public class AFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		ACommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch (com) {
		// 전체 내용 검색
		case("/list.do"):
			command = new AListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;
		// 입력 화면 띄우기
		case("/write_view.do"):
			viewPage = "write_view.jsp";
			break;
		// 입력 하기
		case("/write.do"):
			command = new AWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		// 내용보기
		case("/content_view.do"):
			command = new AContentCommand();
			command.execute(request, response);
			viewPage = "content_view.jsp";
			break;
		// 수정하기
		case("/modify.do"):
			command = new AModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		// 삭제하기
		case("/delete.do"):
			command = new ADeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
