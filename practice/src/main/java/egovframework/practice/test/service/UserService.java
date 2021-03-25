package egovframework.practice.test.service;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;

public interface UserService {
	// 회원가입 처리
	void register(UserVO userVO) throws Exception;

	UserVO login(LoginDTO loginDTO) throws Exception;
}
