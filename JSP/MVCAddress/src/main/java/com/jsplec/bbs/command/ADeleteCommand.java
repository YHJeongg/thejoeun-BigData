package com.jsplec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.bbs.dao.ADao;

public class ADeleteCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				ADao dao = new ADao();
				dao.delete(seq);

	}

}
