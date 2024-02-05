package kr.or.ddit.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;
//스프링 컨트롤러에서 발생하는 예외를 처리하는 핸들러 클래스임을 명시함
@Slf4j
@ControllerAdvice
public class CommonExceptionHandler {
	
	//괄호 안에 설정한 예외 타입을 해당 메소드가 처리한다는 의미
	//IOException, SQLException, NullPointerException, ArrayIndexOutOfBoundsException,
	//ArtimeticException(0으로 나눌경우)
	//Exception -> 최상위 에러 클래스
	@ExceptionHandler(Exception.class)
	public String handle(Exception e ,  Model model) {
		
		log.error("CommonExceptionHandler->handle : " + e.toString());
		e.getStackTrace();	// 배열형태로 온다 => jsp에서(view) 배열(c:forEach) 사용가능
		
		model.addAttribute("exception" , e);
		
		//forwarding : jsp
		return "error/errorCommon";
		
	}
	
	// 여기서 404오류를 처리하기 위해선??
	/*
	404를 프로그래밍적으로 처리하고 싶다면 404 발생 시 예외를 발생시키도록 설정해야 한다.
	(기본적으로 404는 exception 상황이 아니다.) 
	이를 위해 web.xml에서 DispatcherServlet을 등록할 때 throwExceptionIfNoHandlerFound 
	초기화 파라미터를 true로 설정한다.
	 */
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(Exception e) {
		// Exception핸들러 어노테이션 선언
		log.error("CommonExceptionHandler -> handle404 : " + e.toString());
		
		return "error/error404";
	}
	
}
