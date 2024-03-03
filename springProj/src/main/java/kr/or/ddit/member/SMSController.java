package kr.or.ddit.member;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/SMS")
public class SMSController {
	@Autowired
	CertificationService certificationService;
	
	@ResponseBody
	@PostMapping("/check/sendSMS")
    public String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        this.certificationService.certifiedPhoneNumber(phoneNumber,numStr);
        System.out.println("테스트중" + numStr);
        return numStr;
        
    }
	
}