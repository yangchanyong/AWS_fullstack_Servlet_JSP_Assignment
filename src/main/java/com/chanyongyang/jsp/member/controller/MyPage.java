package com.chanyongyang.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanyongyang.jsp.service.MemberService;
import com.chanyongyang.jsp.service.MemberServiceImpl;


@WebServlet("/member/mypage")
public class MyPage extends HttpServlet {
	private MemberService memberService = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getSession().getId();
		req.setAttribute("members", memberService.get(req.getParameter(id)));
		System.out.println(id);
		req.getRequestDispatcher("/WEB-INF/jsp/member/mypage.jsp").forward(req, resp);
//		req.setAttribute("members", new MemberDao(memberService.get()));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	public static void main(String[] args) {
		MemberService memberService = new MemberServiceImpl();
		System.out.println(memberService.get("id1"));
	}
	
	

}
