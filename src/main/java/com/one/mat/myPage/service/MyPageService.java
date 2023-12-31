package com.one.mat.myPage.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.dao.MyPageDAO;


@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO dao;
	public boolean login(String id, String pw) {

		String loginId=dao.login(id,pw); 
		return loginId !=null;
	}
	public MemberDTO MyPageListDo(String id) {
		return dao.MyPageListDo(id);	
	}
	public int myPageModUpdateDo(Map<String, String> params) {
		logger.info("params : " + params);
		return dao.myPageModUpdateDo(params);
		
	}
	public void fullEmailUpdate(String fullEmail, int idx) {
		dao.fullEmailUpdate(fullEmail, idx);
		
	}

	
	public void memberQuitDo(int member_idx) {
		dao.memberQuitDo(member_idx);
		
	}
	
	




}
