package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuickVO {
	
	private String emailAdres;
	private String password;
	private String registerId;
	private Date registDt;
	private String updaterId;
	private Date updateDt;
	
	private MultipartFile[] uploadFile;
	// QUICK : QUICK_ATTACH = 1 : N 
	private List<QuickAttachVO> quickAttachVOList;

}
