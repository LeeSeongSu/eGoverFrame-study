<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="/css/egovframework/sample.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body
	style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">


	<div id="content_pop">

		<!-- search{s} -->
		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right: 10px">
				<select class="form-control form-control-sm" name="searchType"
					id="searchType">
					<option value="si">시</option>
					<option value="gungu">군구</option>
					<option value="kinds">종류</option>
				</select>
			</div>

			<div class="w300" style="padding-right: 10px">
				<input type="text"
					<%-- value="${pagination.keyword}" --%> class="form-control form-control-sm"
					name="keyword" id="keyword">
			</div>
			<button class="btn btn-secondary" name="btnSearch"
				id="btnSearch">검색</button>
				<form action="/excelDown.do" method="post">
				<input type="submit" value="excel">
				</form>
		</div>
		<!-- search{e} -->

		<div>
			<button id="btn_write" type="button"
				class="btn btn-secondary" style="float: right;">추가등록</button>

		</div>

		<!-- List -->
		<div id="table">
			<form id="boardForm" name="boardForm" method="post">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
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
								<div class="d-grid gap-2 d-md-flex justify-content-md-center">
									<a href='#' onclick='fn_view(${result.no})'>
										<button class="btn btn-secondary" type="button">상세보기</button>
									</a>
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

					</c:forEach>
				</table>
			</form>
		</div>

	</div>


</body>
<script type="text/javascript">
	//글 작성 버튼 클릭 시 testRegister로 이동
	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'testRegister.do');

	});
	
	//글조회
	//	어떤 게시물을 클릭했는지 게시물의 번호(no)를 넘겨 줘야 함 따라서 게시물 클릭 이벤트에서 게시물의 번호를 인자 값으로 받습니다.
	//  get 방식으로 데이터를 전송합니다. 따라서 ? 연산자를 사용해 no를 주소 뒤에 붙여 줍니다
	function fn_view(no){
    
  	  var form = document.getElementById("boardForm");
  	  var url = "<c:url value='/testDetail.do'/>";
  	  url = url + "?no=" + no;
    
 	   form.action = url;    
 	   form.submit(); 
	}

		
		// 검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "/testList.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;
		console.log(url);

	});	


</script>
</html>
