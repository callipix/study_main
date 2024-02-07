package kr.or.ddit.chart.service.impl;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.chart.mapper.FruitMapper;
import kr.or.ddit.chart.service.FruitService;
import kr.or.ddit.chart.vo.FruitVO;

@Service
public class FruitServiceImpl implements FruitService {
	@Autowired
	FruitMapper fruitMapper;

	/*
	 * 오버로딩 : 같은 이름의 메소드를 다르게 사용가능(파라미터 개수 , 타입 , 순서) 오버라이드 : 상속받은 부모의 메소드를 자식 메소드에서
	 * 재정의
	 */
	@Override
	public JSONObject fruitList(String gubun) {
		/*
		 * JSONObject 만들기
		 * 
		 */

		List<FruitVO> fruitVOList = this.fruitMapper.fruitList(gubun);

		JSONObject data = new JSONObject();

		// fruitVOList -> json 데이터로 변환
		// 1. cols 배열에 넣기(상품명 , 금액)
		/*
		 * "cols":[
		 * {"id":"","label":"상품명","pattern":"","type":"string"},
		 * {"id":"","label":"금액","pattern":"","type":"number"}
		 * ],
		 */
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		
		JSONArray title = new JSONArray();
		col1.put("label" , "상품명");
		col1.put("type" , "string");
		col2.put("label" , "금액");
		col2.put("type" , "number");
		
		title.add(col1);
		title.add(col2);
		
		data.put("cols" , title);	// 여기까지 cols 완성
		
		//2.rows 배열에 넣기
		//{"c":[{"v":"귤"},{"v":35000}]},
		JSONArray body = new JSONArray();
		
		for(FruitVO fruitVO : fruitVOList) {

			JSONObject prodName = new JSONObject();
			prodName.put("v" , fruitVO.getFruitNm());	// 상품명

			JSONObject money = new JSONObject();
			money.put("v" , fruitVO.getFruitAmt());	// 금액
			
			JSONArray row = new JSONArray();
			row.add(prodName);
			row.add(money);
			
			JSONObject cell = new JSONObject();
			cell.put("c" , row);	// "c" 완성
			body.add(cell);
			
		}// end for
		data.put("rows" , body);
		
		return data;
	}

}
