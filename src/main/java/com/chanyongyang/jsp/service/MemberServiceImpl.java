package com.chanyongyang.jsp.service;

import com.chanyongyang.jsp.dao.MemberDao;
import com.chanyongyang.jsp.domain.Member;

public class MemberServiceImpl implements MemberService {
	private MemberDao dao = new MemberDao();
	
	@Override
	public void register(Member member) {
		dao.insert(member);
	}

	@Override
	public int sighin(String id, String pw) {
		Member member = dao.selectOne(id);
		if(member == null) {
			return 2;
		}
		else if(!member.getPw().equals(pw)) {

			return 3;
		}
		else {
			return 1;
		}
	}

	@Override
	public Member get(String id) {
		return dao.selectOne(id);
	}

	@Override
	public void modify(Member member) {
		dao.modify(member);
	}

	
}
