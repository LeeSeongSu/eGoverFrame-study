package egovframework.practice.test.dao;

import java.util.List;

import egovframework.practice.test.domain.SigunguVO;
import egovframework.practice.test.domain.TestVO;

public interface TestDAO {

	List<TestVO> selectTest(TestVO testVO) throws Exception;

	void insertTest(TestVO testVO) throws Exception;

	TestVO selectDetail(TestVO testVO) throws Exception;

	void updateTest(TestVO testVO) throws Exception;

	void deleteTest(TestVO testVO) throws Exception;

	List<SigunguVO> selectSi(SigunguVO sigunguVO) throws Exception;

	List<SigunguVO> selectGungu(SigunguVO sigunguVO) throws Exception;

	List<SigunguVO> selectDong(SigunguVO sigunguVO) throws Exception;

	List<SigunguVO> selectKinds(SigunguVO sigunguVO) throws Exception;


}