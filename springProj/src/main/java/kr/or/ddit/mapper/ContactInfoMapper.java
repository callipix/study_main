package kr.or.ddit.mapper;

import kr.or.ddit.vo.ContactInfoVO;

public interface ContactInfoMapper {
	
	public int insert(ContactInfoVO contactInfoVO);

	public ContactInfoVO detail(String ciCd);

}