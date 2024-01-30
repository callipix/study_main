package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

//공지사항 게시판
@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	//공지사항 목록 - 누구나 접근 가능
	@GetMapping("/list")
	public String list() {
		log.info("공지사항 목록 - 누구나 접근 가능");
		//forwarding : jsp
		return "notice/list";
	}
//	1. 공지사항 등록 - 로그인 한 관리자만 접근 가능
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
//	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MEMBER')")
//	2. 공지사항 등록 - 로그인(인증) 한 관리자 또는 회원(인가)만 접근 가능
//	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")   
//	@Secured({"ROLE_MEMBER","ROLE_ADMIN"})
//	3. 공지사항 등록 - 로그인(인증) 한 관리자 이면서 회원(인가)만 접근 가능
//	@PreAuthorize("hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')")
//	4. 로그인한 사용자만 접근 가능(권한과 상관 없음)
//	@PreAuthorize("isAuthenticated()")
//	5. 로그인 안 한 사용자가 접근 가능 -> 로그인 한 사용자는 접근 불가
//	@PreAuthorize("isAnonymous()")
//	6. 누구나 접근 가능(PreAuthorize 생략)
	@GetMapping("/register")
	public String register() {
		log.info("공지사항 등록 - 로그인 한 관리자만 접근 가능");
		//forwarding : jsp
		return "notice/register";
	}
}
