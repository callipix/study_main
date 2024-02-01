package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.Getter;

@Data
public class Item3VO {

	private int itemId;
	private String itemName;
	private int price;
	private String description;
	
	private MultipartFile[] uploadFile;
	
	// ITEM3 : ATTACH = 1 : N
	// 중첩된 자바빈
	private List<AttachVO> attachVOList;
	
	
}
