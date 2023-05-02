package com.chanyongyang.jsp.board.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chanyongyang.jsp.domain.Board;
import com.chanyongyang.jsp.domain.Criteria;
import com.chanyongyang.jsp.service.BoardService;
import com.chanyongyang.jsp.service.BoardServiceImpl;
import com.chanyongyang.jsp.util.ParamSolver;
import static com.chanyongyang.jsp.util.ParamSolver.*;

@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet {
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!isSighIn(req)) {
			resp.sendRedirect(req.getContextPath() + "/member/sighin?href=" + URLEncoder.encode(req.getRequestURI(), "utf-8"));
			return;
		}
		req.getRequestDispatcher("/WEB-INF/jsp/board/detail.jsp").forward(req, resp);
		Criteria criteria = new Criteria();
		criteria.getCategory();
	}

	@Override //글작성 주로 나오는 오류는 네임값오류이다. 이름이 맞는지 getParameter에 네임값이 맞는지 꼭 확인하자!
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(!isSighIn(req)) {
			resp.sendRedirect(req.getContextPath() + "/member/sighin?href=" + URLEncoder.encode(req.getRequestURI(), "utf-8"));
			return;
		}
		
		Board board = ParamSolver.getParams(req, Board.class);
		
		boardService.register(board);
		resp.sendRedirect("free");
	}
	
	
	
}
