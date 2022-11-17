package com.jsplec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.bbs.dao.ADao;

public class AModifyCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int seq = Integer.parseInt(request.getParameter("seq"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String relation = request.getParameter("relation");
		
		ADao dao = new ADao();
		dao.modify(seq, name, tel, address, email, relation);
	}

}
