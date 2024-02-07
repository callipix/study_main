package kr.or.ddit.chart.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.chart.service.FruitService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	FruitService fruitService;
	//요청 URI : /chart/chartMain
	@GetMapping("/chartMain")
	public String chartMain() {
		
		// forwarding
		return "chart/chartMain";
	}
	
	// 요청URI : /chart/chart01
	@GetMapping("/chart01")
	public String chart01() {
		//forwarding
		return "chart/chart01";
	}
	
	// 요청URI : /chart/chart01Multi
	@GetMapping("/chart01Multi")
	public String chart01Multi() {
		//forwarding
		return "chart/chart01Multi";
	}
	// 요청URI : /chart/chart02?gubun=fruit
	@ResponseBody
	@GetMapping("/chart02")
	public JSONObject chart02(String gubun) {
		
		JSONObject data = this.fruitService.fruitList(gubun);
		
		log.info("fruitVOList : " + data);
		
		//forwarding
		return data;
	}
	
}