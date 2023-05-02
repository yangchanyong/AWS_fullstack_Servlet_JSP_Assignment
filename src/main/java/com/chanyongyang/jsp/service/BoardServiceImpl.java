package com.chanyongyang.jsp.service;

import java.util.List;

import com.chanyongyang.jsp.dao.BoardDao;
import com.chanyongyang.jsp.domain.Board;
import com.chanyongyang.jsp.domain.Criteria;

public class BoardServiceImpl implements BoardService {
	private BoardDao dao = new BoardDao();
	@Override
	public Long register(Board board) {
		return (long)dao.insert(board);
	}

	@Override
	public Board get(Long bno) {
		dao.increaseHitCount(bno);
//		System.out.println(dao.selectOne(bno));
		return dao.selectOne(bno);
	}

	@Override
	public List<Board> list(Criteria cri) {
		return dao.selectList(cri);
	}

	@Override
	public void modify(Board board) {
		dao.update(board);
	}

	@Override
	public void remove(Long bno) {
		dao.delete(bno);
	}

	@Override
	public int listCount(Criteria cri) {
		return dao.selectListCount(cri);
	}
	
}
