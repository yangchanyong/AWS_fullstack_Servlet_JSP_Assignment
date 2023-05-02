package com.chanyongyang.jsp.member.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanyongyang.jsp.service.MemberService;
import com.chanyongyang.jsp.service.MemberServiceImpl;

@WebServlet("/member/sighin")
public class SighIn extends HttpServlet {
	private MemberService memberService = new MemberServiceImpl();
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/sighin.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		String msg = "";
		String redirectStr = req.getContextPath() + "/";
		switch (memberService.sighin(id, pw)) {
		case 1:
			req.getSession().setAttribute("member", memberService.get(id));
			break;
		case 2:
			msg = "아이디가 없습니다";
			msg = URLEncoder.encode(msg, "utf-8");
			redirectStr += "member/sighin?msg"+msg;
			break;
		case 3:
			msg = "비밀번호가 일치 하지 않습니다";
			msg = URLEncoder.encode(msg, "utf-8");
			redirectStr += "member/sighin?msg"+msg;
		}
		resp.sendRedirect(redirectStr);
	}
	
}
