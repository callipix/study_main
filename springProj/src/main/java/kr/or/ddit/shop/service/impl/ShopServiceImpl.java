package kr.or.ddit.shop.service.impl;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.shop.mapper.ShopMapper;
import kr.or.ddit.shop.vo.EcommerceAttachVO;
import kr.or.ddit.shop.vo.EcommerceColorVO;
import kr.or.ddit.shop.vo.EcommerceSizeVO;
import kr.or.ddit.shop.vo.EcommerceVO;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class ShopServiceImpl implements ShopService {
	@Autowired
	ShopMapper shopMapper;
	@Autowired
	String uploadFolder;
	
	@Override
	public EcommerceVO detail(String ecId) {
		return this.shopMapper.detail(ecId);
	}

	@Override
	@Transactional
	public int createProduct(EcommerceVO ecommerceVO , String ecColor , String ecSize) {
		
		int result = this.shopMapper.createProduct(ecommerceVO);
		
		log.info("createProduct -> result 1이 나와야함 : " + result);
		
		File uploadPath = new File(uploadFolder , getFolder());
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		String uploadFileName ="";
		long size = 0;
		String mime = "";
		
		MultipartFile[] uploadFile = ecommerceVO.getUploadFile();
	
		for(MultipartFile multipartFile : uploadFile) {
			uploadFileName = multipartFile.getOriginalFilename();
			
			mime = multipartFile.getContentType();
			size = multipartFile.getSize();
			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			File saveFile = new File(uploadFolder+"\\"+ getFolder() , uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				
				
				EcommerceAttachVO ecommerceAttachVO = new EcommerceAttachVO();
				ecommerceAttachVO.setEcId(ecommerceVO.getEcId());
				ecommerceAttachVO.setEcImg(uploadFileName);
				ecommerceAttachVO.setEcUrl("/" + getFolder().replace("\\" ,"/") + "/" +uploadFileName);
				ecommerceAttachVO.setEcSize(size);
				ecommerceAttachVO.setEcType(mime);
				result += this.shopMapper.insertEcommerceAttach(ecommerceAttachVO);
				ecommerceVO.getEcommerceAttachVOList().add(ecommerceAttachVO);
				
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}
		
		}
		log.info("insertEcommerceAttach result가 나와야 함 "+ result);
			
			EcommerceColorVO ecommerceColorVO = ecommerceVO.getEcommerceColorVO();
			EcommerceSizeVO ecommerceSizeVO = ecommerceVO.getEcommerceSizeVO();
			
			ecommerceColorVO.setEcId(ecommerceVO.getEcId());
			ecommerceColorVO.setEcColor(ecColor);
			result += this.shopMapper.insertColor(ecommerceColorVO);
			
			ecommerceSizeVO.setEcId(ecommerceVO.getEcId());
			ecommerceSizeVO.setEcSize(ecSize);
			result += this.shopMapper.insertSize(ecommerceSizeVO);
			
			return result;

		}
		
	public String getFolder() {
		// 2024-01-30 형식(format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		// 2024-01-30
		String str = sdf.format(date);
		// 2024-01-30 -> 2024\\01\\30
		return str.replace("-", File.separator);
	}

	// 이미지인지 판단. 썸네일은 이미지만 가능하므로..
	public boolean checkImageType(File file) {
		// MIME(Multipurpose Internet Mail Extensions) : 문서, 파일 또는 바이트 집합의 성격과 형식. 표준화
		// MIME 타입 알아냄. .jpeg / .jpg의 MIME(ContentType)타입 : image/jpeg
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			// image/jpeg는 image로 시작함->true
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 이 파일이 이미지가 아닐 경우
		return false;
	}

}
