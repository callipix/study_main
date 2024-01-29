package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

//공지사항 게시판
@RequestMapping("/notice")
@Slf4j
@Controller
public class NoticeController {
	//공지사항 목록 - 누구나 접근 가능
	@GetMapping("/list")
	public String list() {
		log.info("공지사항 목록 - 누구나 접근 가능");
		//forwarding : jsp
		return "notice/list";
	}
	//공지사항 등록 - 로그인 한 관리자만 접근 가능
	@GetMapping("/register")
	public String register() {
		log.info("공지사항 등록 - 로그인 한 관리자만 접근 가능");
		//forwarding : jsp
		return "notice/register";
	}
}





