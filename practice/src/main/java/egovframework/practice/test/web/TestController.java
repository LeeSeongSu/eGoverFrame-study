package egovframework.practice.test.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibatis.common.logging.Log;

import egovframework.practice.test.domain.Search;
import egovframework.practice.test.domain.SigunguVO;
import egovframework.practice.test.domain.TestVO;
import egovframework.practice.test.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService testServiceImpl;

	// 글 목록 리스트, 페이징, 검색
	@RequestMapping(value = "/testList.do")
	public String testListDo(Model model, @RequestParam(required = false, defaultValue = "si") String searchType,
			@RequestParam(required = false) String keyword, @ModelAttribute("search") Search search) throws Exception {

		// 검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		// 게시글 화면 출력
		model.addAttribute("list", testServiceImpl.selectTest(search));

		return "test/testList";
	}

	// 글 작성 클릭시 글 작성 페이지로 이동
	@RequestMapping(value = "/testRegister.do")
	public String testRegister(SigunguVO sigunguVO, Model model) throws Exception {

		model.addAttribute("si", testServiceImpl.selectSi(sigunguVO));
		model.addAttribute("gungu", testServiceImpl.selectGungu(sigunguVO));
		model.addAttribute("dong", testServiceImpl.selectDong(sigunguVO));
		model.addAttribute("kinds", testServiceImpl.selectKinds(sigunguVO));

		return "test/testRegister";
	}

	// 글 작성 버튼 구현
	@RequestMapping(value = "/insertTest.do")
	public String write(@ModelAttribute("testVO") TestVO testVO, RedirectAttributes rttr) throws Exception {

		// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = testVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\Temp\\" + fileName));
		}
		testVO.setFileName(fileName);

		testServiceImpl.insertTest(testVO);

		return "redirect:testList.do";
	}

	// HttpServletRequest 객체안에 모든 데이터들이 들어가는데 getParameter메소드로 no 원하는 데이터 가져옴
	// 제목 클릭 시 상세보기
	@RequestMapping(value = "/testDetail.do")
	public String viewForm(@ModelAttribute("testVO") TestVO testVO, Model model, HttpServletRequest request)
			throws Exception {

		int no = Integer.parseInt(request.getParameter("no"));
		testVO.setNo(no);
		TestVO resultVO = testServiceImpl.selectDetail(testVO);
		model.addAttribute("result", resultVO);

		return "test/testDetail";
	}

	// 수정하기
	@RequestMapping(value = "/updateTest.do")
	public String updateTest(@ModelAttribute("testVO") TestVO testVO, HttpServletRequest request) throws Exception {
		testServiceImpl.updateTest(testVO);

		return "redirect:testList.do";
	}

	// 삭제하기
	@RequestMapping(value = "/deleteTest.do")
	public String deleteTest(@ModelAttribute("testVO") TestVO testVO) throws Exception {

		testServiceImpl.deleteTest(testVO);
		return "redirect:testList.do";
	}

}