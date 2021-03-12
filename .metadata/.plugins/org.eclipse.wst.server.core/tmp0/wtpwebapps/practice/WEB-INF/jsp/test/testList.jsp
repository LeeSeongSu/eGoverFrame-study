<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="/css/egovframework/sample.css" />
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
								<div class="d-grid gap-2 d-md-flex justify-content-md-center">
									<a href='#' onclick='fn_view(${result.no})'>
										<button class="btn btn-primary me-md-2" type="button">상세보기</button>
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
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		<div>
			<button id="btn_write" type="button" class="btn_write">글작성</button>
		</div>
		<br>
		<!-- pagination{s} -->

		<div id="paginationBox">
			<ul class="pagination">

				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.searchType}', '${search.keyword}')">이전</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="no">

					<li
						class="page-item <c:out value="${pagination.page == no ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onclick="fn_pagination('${no}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					 ,'${search.searchType}', '${search.keyword}')">
							${no} </a></li>
				</c:forEach>

				<c:if test="${pagination.next}">

					<li class="page-item"><a class="page-link" href="#"
						onclick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.searchType}', '${search.keyword}')">다음</a></li>
				</c:if>
			</ul>
		</div>
		<!-- pagination{e} -->

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

			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>
			</div>

		</div>
		<!-- search{e} -->

		<!-- 페이지 목록 갯수   -->
		<div class="form-group row justify-content-center">
			<p>게시판 목록 갯수</p>
			<div class="w100" style="padding-right: 10px">
				<select class="form-control form-control-sm" name="searchType"
					id="listSize" onchange="page(1)">
					<option value="10"
						<c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10개</option>
					<option value="15"
						<c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15개</option>
					<option value="20"
						<c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20개</option>
				</select>
			</div>

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
	//이전 버튼 이벤트
	//5개의 인자값을 가지고 이동 testList.do
	//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
			
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
			
		var url = "/testList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
		}

	  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {

		var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword; 

			location.href = url;	
		}

		//다음 버튼 이벤트
		//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;			
		var url = "/testList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}
		
		
	/* $는 jQuery를 시작하는 명령어로
	$(DOM요소) 와 같은 명령어로 각 요소에 접근 할 수 있다.
	e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
		
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

	/*한페이지당 게시물 */
	function page(no){
	  var startPage = no;
	  var listSize = $("#listSize option:selected").val();
		
	  if(listSize == 10){
		  var url="/testList.do?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 15){
		  var url ="/testList.do?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 20){
	      var url="/testList.do?startPage="+startPage+"&listSize="+listSize
	 
	  }
	  location.href = url;
	}
</script>
</html>
