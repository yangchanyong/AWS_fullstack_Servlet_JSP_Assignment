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

@WebServlet("/member/sighup")
public class SighUp extends HttpServlet {
	private MemberService memberService = new MemberServiceImpl();
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/sighup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		
		
		MemberDao dao = new MemberDao();
		dao.insert(new Member(id, pw, name, null));
		
		String redirecStr = req.getContextPath() + "/";
		resp.sendRedirect(redirecStr);
		
	}
	
}
