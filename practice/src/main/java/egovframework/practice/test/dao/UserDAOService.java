package egovframework.practice.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import antlr.NameSpace;
import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.TestMapper;
import egovframework.practice.test.service.UserMapper;

@Service("userDAOService")
public class UserDAOService implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "egovframework.practice.test.service.UserMapper";

	@Override
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".register", userVO);

	}

	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {

		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}
}
