package egovframework.practice.test.service;

import java.util.List;

import egovframework.practice.test.domain.Search;
import egovframework.practice.test.domain.SigunguVO;
import egovframework.practice.test.domain.TestVO;

public interface TestMapper {

	// 게시물 리스트 조회
	public List<TestVO> selectTest(Search search) throws Exception;
	
	public int getBoardListCnt(Search search) throws Exception;

	public void insertTest(TestVO testVO) throws Exception;

	public TestVO selectDetail(TestVO testVO) throws Exception;

	public void updateTest(TestVO testVO) throws Exception;

	public void deleteTest(TestVO testVO) throws Exception;

	public List<SigunguVO> selectSi(SigunguVO sigunguVO) throws Exception;
	
	public List<SigunguVO> selectGungu(SigunguVO sigunguVO) throws Exception;
	
	public List<SigunguVO> selectDong(SigunguVO sigunguVO) throws Exception;
	
	public List<SigunguVO> selectKinds(SigunguVO sigunguVO) throws Exception;

	


	

}