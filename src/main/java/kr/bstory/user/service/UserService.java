package kr.bstory.user.service;

import javax.servlet.http.HttpSession;

import kr.bstory.common.UserVO;

public interface UserService {

	int selectUserLoginAction(UserVO userPamras, HttpSession session);

	HttpSession selectUserLogout(HttpSession session);
	
	int userSignUp(UserVO userInfo);
}
