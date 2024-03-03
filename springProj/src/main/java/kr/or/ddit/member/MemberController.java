package kr.or.ddit.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	TestService testService;
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
	@ResponseBody
	@PostMapping("/joinInsertAjax")
	public TestServiceVO joinInsertAjax(@RequestBody TestServiceVO testServiceVO) {
		log.info("테스트성공" + testServiceVO);
		int result = this.testService.insert(testServiceVO);
		log.info("result" + result);
		
		return testServiceVO;
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
