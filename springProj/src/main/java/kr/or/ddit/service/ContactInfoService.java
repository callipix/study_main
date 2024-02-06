package kr.or.ddit.service;

import kr.or.ddit.vo.ContactInfoVO;

public interface ContactInfoService {

	public int insert(ContactInfoVO contactInfoVO);
	
	public ContactInfoVO detail(String ciCd);
	
}
