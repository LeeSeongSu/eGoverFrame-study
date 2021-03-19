package egovframework.practice.test.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.practice.test.dao.TestDAO;
import egovframework.practice.test.domain.Search;
import egovframework.practice.test.domain.SigunguVO;
import egovframework.practice.test.domain.TestVO;
import egovframework.practice.test.service.TestMapper;
import egovframework.practice.test.service.TestService;


@Service("testServiceImpl")
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO testDAOService;


	@Override
	public List<TestVO> selectTest(Search search) throws Exception {
		return testDAOService.selectTest(search);
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

	@Override
	public List<SigunguVO> selectSi(SigunguVO sigunguVO) throws Exception {
		return testDAOService.selectSi(sigunguVO);
	}

	@Override
	public List<SigunguVO> selectGungu(SigunguVO sigunguVO) throws Exception {
		return testDAOService.selectGungu(sigunguVO);
	}

	@Override
	public List<SigunguVO> selectDong(SigunguVO sigunguVO) throws Exception {
		return testDAOService.selectDong(sigunguVO);
	}

	@Override
	public List<SigunguVO> selectKinds(SigunguVO sigunguVO) throws Exception {
		return testDAOService.selectKinds(sigunguVO);
	}


	



}