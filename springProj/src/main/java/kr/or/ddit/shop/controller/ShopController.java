package kr.or.ddit.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.shop.service.impl.ShopService;
import kr.or.ddit.shop.vo.EcommerceVO;
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

	/*
	 * @ResponseBody
	 * 
	 * @PostMapping(value="/detailAjax") public ProductVO detailAjax(@RequestBody
	 * ProductVO productVO, Model model) {
	 * 
	 * String pdtId = productVO.getPdtId();
	 * 
	 * productVO = this.shopService.detail(pdtId);
	 * 
	 * return productVO; }
	 */
	
	@PostMapping(value = "/createPost")
	public String createPost(@RequestParam("ecColor") String ecColor , @RequestParam("ecSize") String ecSize, EcommerceVO ecommerceVO) {
		
		int result = this.shopService.createProduct(ecommerceVO , ecColor , ecSize);
		
		log.info("createProduct -> result : " + result);
		return "redirect:/shop/list";
	}
	
	@ResponseBody
	@PostMapping(value = "/createPostAjax")
	public int createPostAjax(@RequestParam("ecColor") String ecColor , @RequestParam("ecSize") String ecSize, EcommerceVO ecommerceVO , Model model) {
		
		log.info("ecommerceVOList(전) : " + ecommerceVO.getEcommerceAttachVOList());
		int result = this.shopService.createProduct(ecommerceVO , ecColor , ecSize);
		log.info("name : " + ecColor);
		log.info("size : " + ecSize);
		
		model.addAttribute("ecommerceVO" , ecommerceVO.getEcommerceAttachVOList());
		log.info("ecommerceVO : " + ecommerceVO);
		log.info("createProduct -> result : " + result);
		log.info("ecommerceVOList(후) : " + ecommerceVO.getEcommerceAttachVOList());
		return result;
	}
	
	@GetMapping(value = "/detail")
	public String detail(String ecId, Model model) {
		log.info("detail->pdtId : " + ecId);

		EcommerceVO ecommerceVO = this.shopService.detail(ecId);
		
		log.info("detail->ecommerceVO : " + ecommerceVO);
		model.addAttribute("ecommerceVO", ecommerceVO);
		
		return "shop/detail";
	}

}
