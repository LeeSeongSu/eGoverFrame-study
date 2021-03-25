package egovframework.practice.test.service.impl;

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

}