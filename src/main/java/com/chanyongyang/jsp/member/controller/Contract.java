package com.chanyongyang.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanyongyang.jsp.service.MemberService;
import com.chanyongyang.jsp.service.MemberServiceImpl;

@WebServlet("/member/contract")
public class Contract extends HttpServlet {
	private MemberService memberService = new MemberServiceImpl();
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/contract.jsp").forward(req, resp);
	}

}
