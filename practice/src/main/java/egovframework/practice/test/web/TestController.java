package egovframework.practice.test.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import commons.interceptor.LoginInterceptor;
import egovframework.practice.cmmn.EgovSampleExcepHndlr;
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
	public String viewForm(@ModelAttribute("testVO") TestVO testVO, @ModelAttribute("sigunguVO") SigunguVO sigunguVO,
			Model model, HttpServletRequest request) throws Exception {

		int no = Integer.parseInt(request.getParameter("no"));
		testVO.setNo(no);
		TestVO resultVO = testServiceImpl.selectDetail(testVO);
		model.addAttribute("result", resultVO);
		model.addAttribute("si", testServiceImpl.selectSi(sigunguVO));
		model.addAttribute("gungu", testServiceImpl.selectGungu(sigunguVO));
		model.addAttribute("dong", testServiceImpl.selectDong(sigunguVO));
		model.addAttribute("kinds", testServiceImpl.selectKinds(sigunguVO));
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

	@RequestMapping(value = "/excelDown.do")
	public void excelDown(Search search, HttpServletResponse response) throws Exception {

		// 게시판 목록조회

		List<TestVO> list = testServiceImpl.selectTest(search);

		// 워크북 생성

		Workbook wb = new HSSFWorkbook();

		Sheet sheet = wb.createSheet("게시판");

		Row row = null;

		Cell cell = null;

		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);

		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("번호");

		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("시");

		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("군구");

		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("총연장");

		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("실측");

		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("조/탐사");

		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("불탐");

		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("단순이기");

		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기타");

		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("성과심사연장");

		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("도면이기객체추출가능여부");

		// 데이터 부분 생성

		for (TestVO result : list) {

			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getNo());

			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getSi());

			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getGungu());

			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbTotal());

			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbActual());

			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbIe());

			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbIndomi());

			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbUnme());

			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbEtc());

			cell = row.createCell(9);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbEtcEx());

			cell = row.createCell(10);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(result.getbEvalue());
		}

		// 컨텐츠 타입과 파일명 지정

		response.setContentType("ms-vnd/excel");

		response.setHeader("Content-Disposition", "attachment;filename=test.xls");

		// 엑셀 출력

		wb.write(response.getOutputStream());

		wb.close();

	}

}