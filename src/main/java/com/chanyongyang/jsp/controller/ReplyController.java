package com.chanyongyang.jsp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanyongyang.jsp.domain.Reply;
import com.chanyongyang.jsp.service.ReplyService;
import com.chanyongyang.jsp.service.ReplyServiceImpl;
import com.chanyongyang.jsp.util.ParamSolver;
import com.google.gson.Gson;

@WebServlet("/reply")
public class ReplyController extends HttpServlet {
	private ReplyService service = new ReplyServiceImpl();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 조회
		Long bno = Long.valueOf(req.getParameter("bno"));
		List<Reply> replies = service.list(bno);
		Gson gson = new Gson();
		String json = gson.toJson(replies); // String type으로 반환
		resp.setContentType("application/json; charset=utf8");
		resp.getWriter().print(json);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 삭제
		Long rno = Long.valueOf(req.getParameter("rno"));
		PrintWriter out = resp.getWriter();
		Reply reply = service.get(rno);
		if(reply != null && ParamSolver.isMine(req, service.get(rno).getWriter())) {
			out.print(service.remove(rno));
		}
		else {
			out.print(0);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Reply reply = ParamSolver.getParams(req, Reply.class);
		service.register(reply);

	}
	
	
}
