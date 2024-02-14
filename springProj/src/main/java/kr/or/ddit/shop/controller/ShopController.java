package kr.or.ddit.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.shop.service.impl.ShopService;
import kr.or.ddit.shop.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@GetMapping
	@RequestMapping(value = "/index")
	public String index() {
		return "shop/index";
	}
	@ResponseBody
	@PostMapping(value="/detailAjax")
	public ProductVO detailAjax(@RequestBody ProductVO productVO, Model model) {
		
		String pdtId = productVO.getPdtId();
		
		productVO = this.shopService.detail(pdtId);
		
		return productVO;
	}
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(String pdtId, Model model) {
		log.info("detail->pdtId : " + pdtId);
		ProductVO productVO = this.shopService.detail(pdtId);
		//StudVO(studId=a001, studNm=개똥이, studPw=JAVA, enabled=1)
		
		log.info("detail->productVO : " + productVO);
		//mav.addObject("속성명", 데이터);
		//session.setAttribute("속성명", 데이터);
		model.addAttribute("productVO", productVO);
		
		//forwarding : jsp
		return "shop/detail";
	}

}
