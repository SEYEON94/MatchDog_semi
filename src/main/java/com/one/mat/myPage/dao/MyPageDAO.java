package com.one.mat.myPage.dao;

import java.util.Map;

import com.one.mat.member.dto.MemberDTO;


public interface MyPageDAO {

	String login(String id, String pw);
	
	MemberDTO MyPageListDo(String id);

	int myPageModUpdateDo(Map<String, String> params);

	
	void memberQuitDo(int member_idx);

	void fullEmailUpdate(String fullEmail, int idx);

	





}
