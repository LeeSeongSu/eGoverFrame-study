package egovframework.practice.test.service;

import java.util.Date;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;

public interface UserService {
	// 회원가입 처리
	void register(UserVO userVO) throws Exception;

	UserVO login(LoginDTO loginDTO) throws Exception;

	void keepLogin(String userId, String sessionId, Date next) throws Exception;

	UserVO checkLoginBefore(String value) throws Exception;
}
