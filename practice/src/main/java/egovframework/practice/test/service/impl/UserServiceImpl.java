package egovframework.practice.test.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.practice.test.dao.UserDAO;
import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAOService;

	@Override
	public void register(UserVO userVO) throws Exception {
		userDAOService.register(userVO);

	}

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return userDAOService.login(loginDTO);
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		userDAOService.keepLogin(userId, sessionId, sessionLimit);
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDAOService.checkUserWithSessionKey(value);
	}

}