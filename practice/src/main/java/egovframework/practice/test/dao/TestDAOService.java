package egovframework.practice.test.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.practice.test.domain.Search;
import egovframework.practice.test.domain.SigunguVO;
import egovframework.practice.test.domain.TestVO;
import egovframework.practice.test.service.TestMapper;

@Service("testDAOService")
public class TestDAOService implements TestDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<TestVO> selectTest(Search search) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);

		return mapper.selectTest(search);
	}

	@Override
	public void insertTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.insertTest(testVO);
	}

	@Override
	public TestVO selectDetail(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectDetail(testVO);
	}

	@Override
	public void updateTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.updateTest(testVO);
	}

	@Override
	public void deleteTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.deleteTest(testVO);
	}

	@Override
	public List<SigunguVO> selectSi(SigunguVO sigunguVO) throws Exception {

		TestMapper mapper = sqlSession.getMapper(TestMapper.class);

		return mapper.selectSi(sigunguVO);
	}

	@Override
	public List<SigunguVO> selectGungu(SigunguVO sigunguVO) throws Exception {

		TestMapper mapper = sqlSession.getMapper(TestMapper.class);

		return mapper.selectGungu(sigunguVO);
	}

	@Override
	public List<SigunguVO> selectDong(SigunguVO sigunguVO) throws Exception {

		TestMapper mapper = sqlSession.getMapper(TestMapper.class);

		return mapper.selectDong(sigunguVO);
	}

	@Override
	public List<SigunguVO> selectKinds(SigunguVO sigunguVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);

		return mapper.selectKinds(sigunguVO);
	}

}