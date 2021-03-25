package egovframework.practice.test.web;

import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.UserService;

@Controller

public class UserLoginController {

	@Autowired
	private UserService userServiceImpl;

	// 로그인 페이지
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "/user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

		UserVO userVO = userServiceImpl.login(loginDTO);

		if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) {
			return;
		}

		model.addAttribute("user", userVO);

	}

}