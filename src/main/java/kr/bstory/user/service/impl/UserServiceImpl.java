package kr.bstory.user.service.impl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.bstory.common.UserVO;
import kr.bstory.user.service.UserService;

@Service("UserService")
@Transactional
@Repository
public class UserServiceImpl implements UserService {
	
	@Inject
	private SqlSessionTemplate sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Override
	public int selectUserLoginAction(UserVO userPamras, HttpSession session) {
		
		logger.info("ParamCheck ::::::::::::" + userPamras);
		
		String userEmail = userPamras.getBs_userEmail();
		String userPassword = userPamras.getBs_userPassword();
		boolean userValiCheck = false;
		
		if(StringUtils.isNotEmpty(userEmail) || StringUtils.isNotBlank(userEmail) || StringUtils.isNotEmpty(userPassword) || StringUtils.isNotBlank(userPassword)) {
			
			userValiCheck = userPamras.isCheckedPasswd(userPassword);
			int userCheck = sqlSession.selectOne("selectUserLoginCheck", userPamras);
			
			if(userCheck > 0) {
				if(userValiCheck) {
					//인증성공
					//로그인 처리
					session.setAttribute("Login", 0);
					session.setAttribute("userEmail", userEmail);
				}
			}
		}
		
		else {
			//error
		}
		return -1;
	}


	@Override
	public HttpSession selectUserLogout(HttpSession session) {
		session.invalidate();
		return session;
	}
	
	@Override
	public int userSignUp(UserVO userInfo) {
		
		String userEmail = userInfo.getBs_userEmail();
		String userName = userInfo.getBs_userName();
		String userPassword = userInfo.getBs_userPassword();
		
		
		
		if(userEmail == null || userName == null || userPassword == null) {
			return -1;
		}
		else {
			sqlSession.insert("userSignUp", userInfo);
		}
		
		return -1;
	}
	
}
