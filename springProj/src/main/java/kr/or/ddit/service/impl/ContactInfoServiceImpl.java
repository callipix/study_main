package kr.or.ddit.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.ContactInfoMapper;
import kr.or.ddit.service.ContactInfoService;
import kr.or.ddit.vo.ContactInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContactInfoServiceImpl implements ContactInfoService {
	
	@Inject
	ContactInfoMapper contactInfoMapper;
	// 업로드 대상 경로
	@Autowired
	String uploadFolder;

	//방문 정보 입력
	@Override
	@Transactional
	public int insert(ContactInfoVO contactInfoVO) {

		int result = 0;
//		int result = this.contactMapper.insert(contactInfoVO);
//		System.out.println("syso : " +contactInfoVO.getCiRegDt());

		String uploadFileName = "";
		long size = 0;
		String mime = "";
		
		// 파일업로드
		
		// 연월일 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		// 스프링 파일 객체
		MultipartFile[] uploadFile = contactInfoVO.getUploadFile();
		
		for (MultipartFile multipartFile : uploadFile) {
			// 원본파일명
			multipartFile.getOriginalFilename();
			size = multipartFile.getSize();
			mime = multipartFile.getContentType();
			// UUID_파일명
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			File saveFile = new File(uploadFolder + "\\" + getFolder(), uploadFileName);

			try {
				// 파일복사 실행
				multipartFile.transferTo(saveFile);

				// 웹경로
				contactInfoVO.setCiImgUrl("/" + getFolder().replace("\\","/") + "/" + uploadFileName);

				result = this.contactInfoMapper.insert(contactInfoVO);

			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}
		}
		/*
		 * uploadFileName = uploadFile.getOriginalFilename(); UUID uuid =
		 * UUID.randomUUID();
		 * 
		 * uploadFileName = uuid.toString() + "_" + uploadFileName;
		 * 
		 * File saveFile = new File(uploadPath ,uploadFileName);
		 * 
		 * try { uploadFile.transferTo(saveFile);
		 * 
		 * contactInfoVO.setCiImgUrl("/" + getFolder().replace("\\" , "/") +
		 * uploadFileName);
		 * 
		 * log.info("insert : " + contactInfoVO); log.info("insert(result) : " +
		 * result); result = this.contactMapper.insert(contactInfoVO);
		 * log.info("insert(result) : " + result); } catch (IllegalStateException |
		 * IOException e) { e.printStackTrace(); }
		 */
		return result;
	}
	// 파일업로드 경로 연월일
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
	   public boolean checkImageType(File file) {
		      //MIME(Multipurpose Internet Mail Extensions) : 문서, 파일 또는 바이트 집합의 성격과 형식. 표준화
		      //MIME 타입 알아냄. .jpeg / .jpg의 MIME타입 : image/jpeg
		      String contentType;
		      try {
		         contentType = Files.probeContentType(file.toPath());
		         log.info("contentType : " + contentType);
		         //image/jpeg는 image로 시작함->true
		         return contentType.startsWith("image");
		      } catch (IOException e) {
		         e.printStackTrace();
		      }
		      //이 파일이 이미지가 아닐 경우
		      return false;
		   }
	@Override
	public ContactInfoVO detail(String ciCd) {
		
		ContactInfoVO contactInfoVO = this.contactInfoMapper.detail(ciCd);
		
		return contactInfoVO;
	}  

}
