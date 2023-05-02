package com.chanyongyang.jsp.service;

import com.chanyongyang.jsp.domain.Member;

public interface MemberService {
	// 회원가입
	void register(Member member);
	// 로그인
	int sighin(String id, String pw);
	
	//회원 단일 조회
	Member get(String id);
	
	// 회원 정보 수정
	void modify(Member member);
}
