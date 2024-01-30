package kr.or.ddit.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class AttachVO {
	private int itemId;
	private int seq;
	private String pictureUrl;
	private int pictureSize;
	private String pitctureType;
	private Date regDate;
}
