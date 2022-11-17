package com.jsplec.bbs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.bbs.dao.ADao;
import com.jsplec.bbs.dto.ADto;

public class AContentCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String seq = request.getParameter("seq");
		ADao dao = new ADao();
		ADto dto = dao.contentView(seq);
		
		request.setAttribute("content_view", dto);
	}

}