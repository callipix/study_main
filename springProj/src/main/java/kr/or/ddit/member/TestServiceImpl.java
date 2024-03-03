package kr.or.ddit.member;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TestServiceMapper;
@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestServiceMapper testServiceMapper;
	
	@Override
	public int insert(TestServiceVO memberVO) {
		int result = this.testServiceMapper.insert(memberVO);
		return result;
	}

}
