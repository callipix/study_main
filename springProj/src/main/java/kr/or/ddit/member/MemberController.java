package kr.or.ddit.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	@GetMapping
	@RequestMapping(value = "/joinKakao")
	public String joinKaKao() {
		
		return "member/joinKakao";
	}
	
	@GetMapping
	@RequestMapping(value = "/join")
	public String join() {
		
		return "member/join";
	}
	
	@GetMapping
	@RequestMapping(value = "/jointest")
	public String joinTest() {
		
		return "member/jointest";
	}
	
	@GetMapping
	@RequestMapping(value = "/mapTest")
	public String mapTest() {
		
		return "member/mapTest";
	}
	@GetMapping
	@RequestMapping(value = "/logintest")
	public String logintest() {
		
		return "member/logintest";
	}
	@GetMapping
	@RequestMapping(value = "/login")
	public String login() {
		
		return "member/login";
	}
	
	

}
