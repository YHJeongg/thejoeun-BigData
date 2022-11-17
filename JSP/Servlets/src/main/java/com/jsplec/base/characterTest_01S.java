package com.jsplec.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class characterTest_01S
 */
@WebServlet("/characterTest_01S")
public class characterTest_01S extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public characterTest_01S() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String animal = request.getParameter("animal");
		String[] food = request.getParameterValues("food");
		
		out.println("<h1>성격 테스트</h1><br>");
		out.println(name + "님의 성격 테스트 결과 <br>");
		out.println(color + "을 좋아하는 당신은 " + animal + " 그리고 ");
		
		for(int i = 0; i < food.length; i++) {
			if(i < food.length - 1) {
				out.println(food[i] + " 과 ");
			} else {
				out.println(food[i]);
			}
		}
		
		out.println("을 좋아하는 성격입니다.");
	}

}
