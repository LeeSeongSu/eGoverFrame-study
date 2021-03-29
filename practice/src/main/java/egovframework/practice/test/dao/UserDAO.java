package egovframework.practice.test.dao;

import java.util.Date;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;

public interface UserDAO {

	// 회원가입 처리
	void register(UserVO userVO) throws Exception;

	UserVO login(LoginDTO loginDTO) throws Exception;
	
	// 로그인 유지 처리
	void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

	// 세션키 검증
	UserVO checkUserWithSessionKey(String value) throws Exception;
}
