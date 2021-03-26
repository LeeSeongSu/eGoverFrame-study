package egovframework.practice.test.web;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.UserService;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping("/user")
public class UserRegisterController {

	@Autowired
	private UserService userServiceImpl;

	// 회원가입 페이지
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		return "user/register";
	}

	// 회원가입 처리
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {

		String hashedPw = BCrypt.hashpw(userVO.getUserPw(), BCrypt.gensalt());
		userVO.setUserPw(hashedPw);
		userServiceImpl.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");

		return "redirect:/";
	}

}