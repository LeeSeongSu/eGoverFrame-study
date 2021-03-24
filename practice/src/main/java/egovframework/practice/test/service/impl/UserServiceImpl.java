package egovframework.practice.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.practice.test.dao.UserDAO;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.TestService;
import egovframework.practice.test.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAOService;

	public void createUser(UserVO userVO) throws Exception {
		userDAOService.createUser(userVO);
	}

	@Override
	public UserVO getUserById(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeUserById(String id) throws Exception {
		// TODO Auto-generated method stub
		
	}

}