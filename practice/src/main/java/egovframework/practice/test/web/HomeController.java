package egovframework.practice.test.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import egovframework.practice.test.domain.UserVO;
import egovframework.practice.test.service.UserService;


/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@Autowired
	private UserService userServiceImpl;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String getsignup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "test/signUp";
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String postsignup(UserVO userVO) throws Exception {
		userServiceImpl.createUser(userVO);
		logger.info("user sign up!");

		return "redirect:/";
	}

}