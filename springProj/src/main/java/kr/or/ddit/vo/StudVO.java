package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

//자바빈 클래스
//PoJo위배
@Data
public class StudVO {
	private int    rnum;
	private String studId;
	private String studNm;
	private String studPw;
	private String enabled;
	private String studDet;//학생 상세->STUD_DET
	private String[] hobby;//학생 취미들
	private String gender;//성별
	private String nationality;//국적
	
	//StudVO : StudAuthVO = 1 : N
	private List<StudAuthVO> studAuthVOList;
	
	//STUD : HOBBY = 1 : N
	//중첩된(Nested) 자바빈
	private List<HobbyVO> hobbyVOList;
	
	//일반 생성자
	public StudVO(String studId, String studNm, String studPw) {
		this.studId = studId;
		this.studNm = studNm;
		this.studPw = studPw;
	}
	//기본 생성자
	public StudVO() {}
	
}



