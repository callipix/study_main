package kr.or.ddit.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.ItemMapper;
import kr.or.ddit.service.ItemService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.Item2VO;
import kr.or.ddit.vo.Item3VO;
import kr.or.ddit.vo.ItemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemMapper itemMapper;
	@Autowired
	String uploadFolder;

	@Override
	public int registerPost(ItemVO itemVO) {
		return this.itemMapper.registerPost(itemVO);
	}

	@Override
	public int registerPost2(Item2VO item2VO) {
		return this.itemMapper.registerPost2(item2VO);
	}

	@Override
	public int registerPost3(Item3VO item3VO) {
		
		//ITEM3테이블 insert
        /*
        Item3VO(itemId=0, itemName=삼성태블릿, price=120000, description=쓸만함, 
        uploadFile=[파일객체1, 파일객체2, 파일객체3], attachVOList=null)
         */
		//Item3VO(itemId = 1..)
		// sql 성공 행의 수
		int result = this.itemMapper.registerPost3(item3VO); // 부모테이블 1
		
		// 원본 파일명
		String uploadFileName = "";
		// 파일크기 (byte(1) short(2) int(4) long(8) )
		long size = 0;
		// MiME타입
		String mime = "";
		// ATTACH 테이블의 SEQ컬럼을 위한 카운터변수
		int seq = 1;

		MultipartFile[] uploadFile = item3VO.getUploadFile();

		// 스프링 파일 객체 배열로부터 스프링 파일 객체를 하나씩 가져와보자
		// MultipartFile[] uploadFile		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------------------");
			log.info("원본 파일명 : " + multipartFile.getOriginalFilename());
			log.info("파일 크기    : " + multipartFile.getSize());
			log.info("MIME타입  : " + multipartFile.getContentType());

			uploadFileName = multipartFile.getOriginalFilename();
			size = multipartFile.getSize();
			mime = multipartFile.getContentType();

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			// File객체 설계(어디로 복사할것인지? 경로)
//			File saveFile = new File(uploadFolder , getFolder());
			// ↕↕↕↕↕↕ 동일
			File saveFile = new File(uploadFolder + "\\" +getFolder(), uploadFileName);
			// 파일 복사 실행
			// 파일 객체.복사하겠다To(saceFile)
			try {
				multipartFile.transferTo(saveFile);
				
				//ATTACH 테이블 insert
				AttachVO attachVO = new AttachVO();
				attachVO.setItemId(item3VO.getItemId());
				// 부모테이블의 기본키를 자식테이블의 외래키로 넘긴다
				// 시퀀스 번호는 자바에서 처리해서 insert
				attachVO.setSeq(seq++);
				// 웹경로처리 : / + 연/월/일 + / + uuid_원본파일명
				attachVO.setPictureUrl("/"+getFolder().replace("\\", "/") + "/"+uploadFileName);
				
				attachVO.setPictureSize(size);
				attachVO.setPictureType(mime);
				log.info("attachVO : " + attachVO);
				
				result += this.itemMapper.insertAttach(attachVO);	//자식테이블 N
				
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}			
		}
		// 총 4가 리턴되어야 한다.
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
