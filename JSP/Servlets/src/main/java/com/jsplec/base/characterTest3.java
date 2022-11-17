package com.jsplec.base;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class characterTest01
 */
@WebServlet("/characterTest3")
public class characterTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public characterTest3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 입력값 request 로 가져오기.
		// -- 이름
		String name = request.getParameter("name");
		// -- 색상
		String color = request.getParameter("color");
		// -- 동물
		String animal = request.getParameter("animal");
		// -- 음식
		String[] food = request.getParameterValues("food");
		
		
		// Servlets 에서 저장하는 방법 writer 사용.
		String filename = "testchar.txt";
		String result;
		String result2 = "";
		
		PrintWriter writer = null;
		try{
			String filePath = getServletContext().getRealPath(filename);
			System.out.println(filePath);
			writer = new PrintWriter(filePath); // 메모장에 썻다고 생각.
			writer.println("이름 : " + name);
			writer.println("색상 : " + color);
			writer.println("동물 : " + animal);
			writer.println("음식 : " + Arrays.toString(food));
			
			result = "저장되었습니다.";
//			response.sendRedirect("http://localhost:8080/JSP/characterTest_02.jsp?result=save");
			
		}catch(IOException ioe){
			
			result = "파일에 문제가 있어 저장을 하지 못했습니다.";
			
		}finally{
			try{
				writer.close(); // 클로즈 안하면 저장을 안한다. 꼭 해줘야한다.
			}catch(Exception e){
				
			}
		}
		
		BufferedReader reader = null;
		try{
			String filePath = getServletContext().getRealPath("testchar.txt");
//			out.println(filePath);
			reader = new BufferedReader(new FileReader(filePath));
			while(true){ // 파일이 몇글자인지 모르니 와일문사용.	
				String str = reader.readLine();
				if(str == null) {
					break;
				}
				result2 += (str + "<br>");
			}
			
		}catch(FileNotFoundException fnfe){
			result2 = "파일이 존재하지 않습니다.";
		}catch(IOException ioe){
			result2 = "파일을 읽을 수 없습니다.";		
		}finally{ // 파일에서 가장 중요한것. 정상적이여도 오류가 있어도 파이널리로 처리를 해줘야한다.
			try{
				reader.close();
			}catch(Exception e){
				
			}
		}

		
		request.setAttribute("result2", result2);
		request.setAttribute("result", result);
		request.setAttribute("name", name);
		request.setAttribute("color", color);
		request.setAttribute("animal", animal);
		request.setAttribute("food", Arrays.toString(food));
		
		RequestDispatcher rd = request.getRequestDispatcher("characterTest3_02.jsp");
		rd.forward(request, response);
		
		
		// 바로 출력
//		out.println("<html>");
//		out.println("<head>");
//		out.println("</head>");
//		out.println("<body>");
//		
//		out.println("<h1>성격테스트</h1>");
//		out.println("<br>"+ name +"님의 성격 테스트 결과"+"<br>");
//		out.println(color+"색을 좋아하는 당신은" + animal + "그리고");
//		for(int i=0; i< food.length; i++) {
//			if(i <food.length-1) {
//			out.println(food[i] + "과");
//			}else {
//				out.println(food[i]);
//			}
//		}
//		out.println("을 좋아하는 성격입니다.");
//	
//		
//		out.println("</body>");
//		out.println("</html>");
	
		
	
	
	}

} // END
