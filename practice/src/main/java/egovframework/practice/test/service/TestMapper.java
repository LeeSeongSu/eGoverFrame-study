package egovframework.practice.test.service;

import java.util.List;


import egovframework.practice.test.domain.TestVO;

public interface TestMapper {

	// 게시물 리스트 조회
	public List<TestVO> selectTest(TestVO testVO) throws Exception;

	public void insertTest(TestVO testVO);

	public TestVO selectDetail(TestVO testVO);

	public void updateTest(TestVO testVO);

	public void deleteTest(TestVO testVO);

	
}