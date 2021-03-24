package egovframework.practice.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.UserMapper;

@Service("userDAOService")
public class UserDAOService implements UserDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void createUser(UserVO userVO) throws Exception {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.createUser(userVO);

	}

}
