package kr.or.ddit.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.ContactMapper;
import kr.or.ddit.service.ContactService;
import kr.or.ddit.vo.ContactInfoVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ContactServiceImpl implements ContactService {
	
	@Autowired
	ContactMapper contactMapper;
	@Autowired
	String uploadFolder;

	@Override
	public int insert(ContactInfoVO contactInfoVO) {

		int result = 0;
//		int result = this.contactMapper.insert(contactInfoVO);
				
//		System.out.println("syso : " +contactInfoVO.getCiRegDt());
		
		String uploadFileName = "";
	
		MultipartFile uploadFile = contactInfoVO.getUploadFile();
		
		File uploadPath = new File(uploadFolder , getFolder());
		
		// 연월일 폴더 생성
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		uploadFileName = uploadFile.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		
		File saveFile = new File(uploadPath ,uploadFileName);
		
		try {
			uploadFile.transferTo(saveFile);
			
			contactInfoVO.setCiImgUrl("/" + getFolder().replace("\\" , "/") + uploadFileName);
			
			log.info("insert : " + contactInfoVO);
			log.info("insert(result) : " + result);
			result = this.contactMapper.insert(contactInfoVO);
			log.info("insert(result) : " + result);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	  public String getFolder() {
	      // 2024-01-30 형식(format) 지정
	      // 간단한 날짜 형식
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      // 날짜 객체 생성(java.util 패키지)
	      Date date = new Date();
	      // 2024-01-30 -> 2024\\01\\30
	      String str = sdf.format(date);
	      
	      return str.replace("-", File.separator);
	      
	      // file.separator -> 파일 이름 구분자 (2024\\01\\30)
	   }

}
