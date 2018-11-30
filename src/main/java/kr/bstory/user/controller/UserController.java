package kr.bstory.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.bstory.common.UserVO;
import kr.bstory.user.service.UserService;

@Controller
@RequestMapping(value="/user/*")
public class UserController {

	@Inject
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="signIn&Register.ino", method= {RequestMethod.GET, RequestMethod.POST})
	public String userSignUp() {
		String rtnPath = "user/signin&register";
		return rtnPath;
	}
	
	@RequestMapping(value="userList.ino", method= {RequestMethod.GET, RequestMethod.POST})
	public String userList() throws Exception {
		String rtnPath = "";
		return rtnPath;
	}
	
	@RequestMapping(value="userLoginAction.ino", method= {RequestMethod.GET, RequestMethod.POST})
	public String userLoginAction(@ModelAttribute UserVO userPamras, HttpSession session) throws Exception {
		String rtnPath = "redirect:/main/index.ino";
		userService.selectUserLoginAction(userPamras, session);
		return rtnPath;
	}
	
	@RequestMapping(value="userLogout.ino", method= {RequestMethod.GET, RequestMethod.POST})
	public String userLogout(HttpSession session) throws Exception {
		String rtnPath = "redirect:/main/index.ino";
		userService.selectUserLogout(session);
		return rtnPath;
	}
	
	@RequestMapping(value="userSignAction.ino", method= {RequestMethod.GET, RequestMethod.POST})
	public String userSignAction(@ModelAttribute UserVO userInfo) {
		String rtnPath = "redirect:/main/index.ino";
		userService.userSignUp(userInfo);
		return rtnPath;
	}

	
}
