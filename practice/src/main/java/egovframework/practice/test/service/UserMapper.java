package egovframework.practice.test.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.practice.test.domain.UserVO;

public interface UserMapper {

	public void createUser(UserVO userVO);

	UserVO getUserById(String id);

	List<UserVO> getUserAll = null;

	void updateUser(UserVO userVO);

	void removeUserById(String id);

}
