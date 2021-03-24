package egovframework.practice.test.service;

import java.util.List;

import egovframework.practice.test.domain.UserVO;

public interface UserService {
	public void createUser(UserVO userVO) throws Exception;

	public UserVO getUserById(String id) throws Exception;

	public List<UserVO> getUserAll = null;

	public void updateUser(UserVO userVO) throws Exception;

	public void removeUserById(String id) throws Exception;
}
