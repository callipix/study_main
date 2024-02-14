package kr.or.ddit.shop.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EcommerceVO {
	public String ecId;
	public String ecName;
    public String ecColor;
    public String ecDetail;
    
    private MultipartFile[] uploadFile;
    private List<EcommerceAttachVO> ecommerceAttachVO;
	private List<EcommerceAttach2VO> ecommerceAttach2VO;
	
}