package egovframework.practice.test.dao;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;

public interface UserDAO {

	// 회원가입 처리
	void register(UserVO userVO) throws Exception;

	UserVO login(LoginDTO loginDTO) throws Exception;
}
