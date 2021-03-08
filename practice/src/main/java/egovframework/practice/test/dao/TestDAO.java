package egovframework.practice.test.dao;

import java.util.List;


import egovframework.practice.test.domain.TestVO;

public interface TestDAO {

	List<TestVO> selectTest(TestVO testVO) throws Exception;

	void insertTest(TestVO testVO) throws Exception;

	TestVO selectDetail(TestVO testVO) throws Exception;

	void updateTest(TestVO testVO) throws Exception;

	void deleteTest(TestVO testVO) throws Exception;



}