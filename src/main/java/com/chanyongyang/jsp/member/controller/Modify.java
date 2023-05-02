package com.chanyongyang.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanyongyang.jsp.dao.MemberDao;
import com.chanyongyang.jsp.domain.Member;
import com.chanyongyang.jsp.service.MemberService;
import com.chanyongyang.jsp.service.MemberServiceImpl;
import com.chanyongyang.jsp.util.ParamSolver;


@WebServlet("/member/modify")
public class Modify extends HttpServlet {
	private MemberService memberService = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/modify.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		Member member = ParamSolver.getParams(req, Member.class);
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		
		
		req.getSession().invalidate();
		resp.sendRedirect(req.getContextPath());
		
		
	}

	private Member member(String string, String string2, String string3) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
