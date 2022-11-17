package com.jsplec.bbs.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.bbs.dao.ADao;
import com.jsplec.bbs.dto.ADto;

public class AListCommand implements ACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ADao dao = new ADao();
		ArrayList<ADto> dtos = dao.list();
		request.setAttribute("list", dtos);

	}

}
