package egovframework.practice.test.service;

import java.util.Date;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;

public interface UserMapper {

	public void register(UserVO userVO);

	public UserVO login(LoginDTO loginDTO) throws Exception;

	// 로그인 유지 처리
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

	// 세션키 검증
	public UserVO checkUserWithSessionKey(String value) throws Exception;
}
