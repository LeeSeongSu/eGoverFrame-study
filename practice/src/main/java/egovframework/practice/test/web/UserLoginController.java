package egovframework.practice.test.web;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import egovframework.practice.test.domain.LoginDTO;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.UserService;

@Controller
@RequestMapping("/user")
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
		
		// 로그인 유지를 선택할 경우
		if (loginDTO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7; // 7일
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
			userServiceImpl.keepLogin(userVO.getUserId(), httpSession.getId(), sessionLimit);
		}
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {

		Object object = httpSession.getAttribute("login");
		if (object != null) {
			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userServiceImpl.keepLogin(userVO.getUserId(), "none", new Date());
			}
		}

		return "/user/logout";
	}
}