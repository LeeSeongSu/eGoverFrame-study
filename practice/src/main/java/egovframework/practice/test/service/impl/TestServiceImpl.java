package egovframework.practice.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.practice.test.dao.TestDAO;

import egovframework.practice.test.domain.TestVO;
import egovframework.practice.test.service.TestService;

@Service("testServiceImpl")
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO testDAOService;

	@Override
	public List<TestVO> selectTest(TestVO testVO) throws Exception {
		return testDAOService.selectTest(testVO);
	}


	@Override
	public void insertTest(TestVO testVO) throws Exception {
		testDAOService.insertTest(testVO);
	}

	@Override
	public TestVO selectDetail(TestVO testVO) throws Exception {
		/*
		 * TestVO resultVO = testDAOService.selectDetail(testVO); return resultVO;
		 */
		return testDAOService.selectDetail(testVO);
	}

	@Override
	public void updateTest(TestVO testVO) throws Exception {
		testDAOService.updateTest(testVO);
	}

	@Override
	public void deleteTest(TestVO testVO) throws Exception {
		testDAOService.deleteTest(testVO);
	}
}