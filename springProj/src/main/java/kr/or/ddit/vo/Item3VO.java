package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class Item3VO {

	private int itemId;
	private String itemName;
	private int price;
	private String description;
	
	// ITEM3 : ATTACH = 1 : N
	// 중첩된 자바빈
	private List<AttachVO> attachVOList;
}
