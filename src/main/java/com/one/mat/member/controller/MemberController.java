package com.one.mat.member.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.dto.VisitorDTO;
import com.one.mat.admin.service.DashBoardService;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.member.service.MailSendService;
import com.one.mat.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService service;
	@Autowired MailSendService mailService;
	@Autowired DashBoardService DBService;
	
	@RequestMapping(value="/joinForm.go")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value="/joinAgree.go")
	public String joinAgree() {
		return "joinAgree";
	}
	
	@RequestMapping(value="/overlayId.do", method=RequestMethod.POST)
	@ResponseBody // ajax에서 반환하는 값을 response에 그려주는 역할을 한다.
	public HashMap<String,Object> overlayId(@RequestParam String member_id) {
		boolean use = service.overlayId(member_id);
		logger.info("사용 가능 여부 : "+use);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);	
		return map;
	}
		
	@RequestMapping(value="/overlayNick.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> overlayNick(@RequestParam String member_nickName){
		logger.info("member_nickName"+member_nickName);
		boolean use = service.overlayNick(member_nickName);
		logger.info("사용 가능 여부 : "+use);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);
		return map;
	}

	@RequestMapping(value="/joinMailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String joinMailCheck(@RequestParam String member_email) {
		int idx = member_email.indexOf("@");
		String mailId = member_email.substring(0, idx);
		
		System.out.println("메일 앞쪽 주소 : "+mailId);
		System.out.println("이메일 인증 요청이 들어옴.");
		System.out.println("이메일주소 : "+member_email);
		return mailService.joinMailCheck(member_email);	
	}
	
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> join(@RequestBody MemberDTO dto) {
		logger.info("params : "+dto.getMember_id());		
						
		String member_id = dto.getMember_id();
		String member_pw=dto.getMember_pw();
		
		
		String member_name = dto.getMember_name();
		String member_nickName = dto.getMember_nickName();
		Date member_birth = dto.getMember_birth();
		String member_gender = dto.getMember_gender();
		String member_email = dto.getMember_email();
		String member_roadAddr = dto.getMember_roadAddr();
		String member_parcelAddr = dto.getMember_parcelAddr();
		String member_detailAddr = dto.getMember_detailAddr();
		String member_dongAddr = dto.getMember_dongAddr();
		String member_phone = dto.getMember_phone();		
		Date member_regDate = dto.getMember_regDate();
		String member_renew = dto.getMember_renew();
		String member_subs = dto.getMember_subs();
		String member_quit = dto.getMember_quit();
		String member_loginLock=dto.getMember_loginLock();
		int subsType_code = dto.getSubsType_code();		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("member_id", member_id);
		result.put("member_pw", member_pw);
		result.put("member_name", member_name);
		result.put("member_nickName", member_nickName);
		result.put("member_birth", member_birth);
		result.put("member_gender", member_gender);
		result.put("member_email", member_email);
		result.put("member_roadAddr", member_roadAddr);
		result.put("member_parcelAddr", member_parcelAddr);
		result.put("member_detailAddr", member_detailAddr);
		result.put("member_dongAddr", member_dongAddr);
		result.put("member_phone", member_phone);
		result.put("member_loginLock", member_loginLock);
		result.put("member_regDate", member_regDate);
		result.put("member_renew", member_renew);
		result.put("member_subs", member_subs);
		result.put("member_quit", member_quit);
		result.put("subsType_code", subsType_code);
		
		int row = service.join(dto);
		result.put("success", row);
		return result;
	}
	
	@RequestMapping(value="/login.go")
	public String login() {
		return "login";
	}
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String member_id, @RequestParam String member_pw) {
		String page = "login";
		logger.info("member id:"+member_id+"/"+member_pw);
		MemberDTO dto = service.login(member_id, member_pw);
		logger.info("dto :"+dto);
		ArrayList<ProfileDTO> pdto = service.loginProf(member_id, member_pw);		
		if (dto != null) {
			// 1. 프로필이 있는지 / 2.로그인 금지 제재 여부 / 3. 구독 여부 / 4. 탈퇴 여부 -> dto에 넣을 정보		
			session.setAttribute("loginInfo", dto);
			session.setAttribute("loginProInfo", pdto);		
			int member_idx = dto.getMember_idx();
			logger.info("접속한 세션 회원번호="+member_idx);
			logger.info("제재여부 ="+dto.getMember_loginLock());
			logger.info("탈퇴여부 ="+dto.getMember_quit());			
			logger.info("프로필 갯수 : "+pdto.size());
			boolean hasRegProfile = checkRegProfile(pdto);
			
			VisitorDTO VisitorDTO = DBService.selectVisitCount(member_idx);
			if(VisitorDTO==null) {
				DBService.insertVisitCount(member_idx);
			}else {
				DBService.updateVisitCount(member_idx);
			}				
			
			if("Y".equals(dto.getMember_loginLock())) {
				model.addAttribute("msg", "제재당한 회원입니다.");
				page = "login";
			}else if ("Y".equals(dto.getMember_quit())) {
				model.addAttribute("msg", "탈퇴한 회원입니다.");
				page = "login";
			}else if(dto.getSubsType_code()==4) {
				page = "dashBoard";
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다.");
			}else if(hasRegProfile) {				
				page = "redirect:/regProfile";
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다. 프로필을 등록해주세요");
			}else {
				page = "home"; // 서비스 메인 페이지로 이동
				model.addAttribute("msg", dto.getMember_nickName()+"님 환영합니다.");
			}			

		} else { // 로그인 실패
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요.");
			page = "login";
		}
		return page;
	}
		
	private boolean checkRegProfile(ArrayList<ProfileDTO> pdto) {
		for (ProfileDTO profileDTO : pdto) {
			if(profileDTO.getPro_idx() == 0) {
				return true;
			};
		}		
		return false;
	}

	@RequestMapping(value="/idFind.go")
	public String idFind() {
		return "idFind";
	}
	
		
	@RequestMapping(value="/nameMailChk.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sendFindIdMail(@RequestBody MemberDTO dto){
		HashMap<String, Object> result = new HashMap<String, Object>();
		int row = service.nameMailChk(dto);
		logger.info("해당 데이터 개수 : "+row);
					
		if(row==0) {
			result = new HashMap<String, Object>();
			result.put("msg", "해당하는 정보의 유저가 없습니다.");
		}else {
			result = new HashMap<String, Object>();					
			int authNumber = mailService.sendFindIdMail(dto);
			
			String member_name = dto.getMember_name();
			String member_email = dto.getMember_email();
			String member_id=service.informId(dto);
			result.put("member_id", member_id);
			result.put("member_name", member_name);
			result.put("member_email", member_email);
			logger.info("인증번호 : "+authNumber);
			result.put("msg", "인증번호를 보냈습니다.");
			result.put("authNumber", authNumber);			
		}		
		return result;
	}
		
	
	@RequestMapping(value="/pwFind.go")
	public String pwFind() {
		return "pwFind";
	}	
	
	
	@RequestMapping(value="/userMailChk.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sendFindPwMail(@RequestBody MemberDTO dto){
		HashMap<String, Object> result = new HashMap<String, Object>();		
		int row = service.userMailChk(dto);		
		logger.info("해당 데이터 개수 :"+row);
		
		if(row==0) {
			result = new HashMap<String, Object>();
			result.put("msg", "해당하는 정보의 유저가 없습니다.");
		}else {
			result = new HashMap<String, Object>();		
			int authNumber = mailService.sendFindPwMail(dto);
			
			String member_id = dto.getMember_id();
			String member_email = dto.getMember_email();
			result.put("member_id", member_id);
			result.put("member_email", member_email);			
			logger.info("인증번호 : "+authNumber);
			result.put("msg", "인증번호를 보냈습니다.");
			result.put("authNumber", authNumber);			
		}		
		return result;
	}	
	
	
	@RequestMapping(value="/sendPwMail.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sendPwMail(@RequestParam String member_id, @RequestParam String member_email) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		MemberDTO dto = mailService.sendPwMail(member_id, member_email);		
		result.put("dto", dto);
		return result;
	}
		
	
}
