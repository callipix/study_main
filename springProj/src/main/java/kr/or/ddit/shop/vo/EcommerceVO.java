package kr.or.ddit.shop.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class EcommerceVO {
	
	public String ecId;
	public String ecName;
    public int ecPrice;
    public String ecDetail;

    private MultipartFile[] uploadFile;
    
    // ECOMMERCE : ECOMMERCE_ATTACH = 1 : N
    private List<EcommerceAttachVO> ecommerceAttachVOList;
    
    private EcommerceColorVO ecommerceColorVO;
    
    private EcommerceSizeVO ecommerceSizeVO;
    
    public EcommerceVO() {
    	ecommerceAttachVOList = new ArrayList<EcommerceAttachVO>();
    	ecommerceColorVO = new EcommerceColorVO();
    	ecommerceSizeVO = new EcommerceSizeVO();
    }
    
}