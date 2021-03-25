package egovframework.practice.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.TestMapper;
import egovframework.practice.test.service.UserMapper;

@Service("userDAOService")
public class UserDAOService implements UserDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void register(UserVO userVO) throws Exception {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.register(userVO);

	}

	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);

		return mapper.login(loginDTO);
	}
}
