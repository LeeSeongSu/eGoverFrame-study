<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/sample.css'/>" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body
	style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">


	<div id="content_pop">


		<!-- List -->
		<div id="table">
			<form id="boardForm" name="boardForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<th rowspan="2" colspan="3" align="center">구분</th>
						<th rowspan="2" colspan="2" align="center">연도</th>
						<th colspan="6" align="center">구분</th>
						<th rowspan="2" align="center">성과심사연장</th>
						<th rowspan="2" align="center">도면이기객체추출가능여부</th>
						<th rowspan="2" colspan="2" align="center">선택</th>
					</tr>

					<tr>
						<th>총연장</th>
						<th>실축</th>
						<th>조/탐사</th>
						<th>불량</th>
						<th>단순이기</th>
						<th>기타</th>
					</tr>

					<c:forEach var="result" items="${list}" varStatus="status">
						<tr>

							<td rowspan="2" align="center" class="listtd"><c:out
									value="${result.no}" />&nbsp;</td>
							<td rowspan="2" align="center" class="listtd"><c:out
									value="${result.si}" />&nbsp;</td>
							<td rowspan="2" align="center" class="listtd"><c:out
									value="${result.gungu}" />&nbsp;</td>
							<td colspan="2" align="center" class="listtd">2010년 까지</td>
							<td align="center" class="listtd"><c:out
									value="${result.bTotal}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bActual}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bIe}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bIndomi}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bEtc}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bUnme}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bEvalue}" />&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.bStatus}" />&nbsp;</td>


							<td rowspan="2">
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<a href='#' onclick='fn_view(${result.no})' />
									<button class="btn btn-primary me-md-2" type="button">상세보기</button>
								</div>
							</td>
							<tr>
								<td colspan="2" align="center" class="listtd">2010년 이후</td>
								<td align="center" class="listtd"><c:out
										value="${result.aTotal}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aActual}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aIe}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aIndomi}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aEtc}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aUnme}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aEvalue}" />&nbsp;</td>
								<td align="center" class="listtd"><c:out
										value="${result.aStatus}" />&nbsp;</td>


							</tr>

						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		<div>
			<button id="btn_write" type="button" style="float: right;"btn_write">글작성</button>
		</div>
	</div>

<script type="text/javascript">
	//글 작성 버튼 클릭 시 testRegister로 이동
 	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'testRegister.do');

	}); 
	
	//글조회
	//	어떤 게시물을 클릭했는지 게시물의 번호(no)를 넘겨 줘야 함 따라서 게시물 클릭 이벤트에서 게시물의 번호를 인자 값으로 받습니다.
	//  get 방식으로 데이터를 전송합니다. 따라서 ? 연산자를 사용해 gu를 주소 뒤에 붙여 줍니다
	function fn_view(no) {

		var form = document.getElementById("boardForm");
		var url = "<c:url value='/testDetail.do'/>";
		url = url + "?no=" + no;

		form.action = url;
		form.submit();
	}
</script>
</body>

</html>
