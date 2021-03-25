package egovframework.practice.test.service;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;

public interface UserMapper {

	public void register(UserVO userVO);

	UserVO login(LoginDTO loginDTO) throws Exception;
}
