<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

</head>
<body>

	<div class="container">
		<form action="updateTest.do" id="viewForm" method="post"
			encType="multiplart/form-data">
			<table class="table table-bordered">

				<thead>
					<h3>기본정보</h3>
				</thead>
				<tbody>

					<tr>
						<th>기관</th>
						<td><select name="si" class="form-control form-control-sm">

								<option><c:out value="${result.si}" /></option>

						</select> <select name="gungu" class="form-control form-control-sm">

								<option><c:out value="${result.gungu}" /></option>

						</select></td>

						<th>담당자</th>
						<td><input type="text" name="name" value="${result.name}"
							class="form-control" /></td>
					</tr>

					<tr>
						<th>전화번호</th>
						<td><input type="text" value="${result.phoneNumber}"
							name="phoneNumber" class="form-control" /></td>
						<th>시설물</th>
						<td><select name="kinds" class="form-control form-control-sm">

								<option><c:out value="${result.kinds}" /></option>

						</select></td>
					</tr>
				</tbody>
			</table>
			<br> <br> <br>
			<table class="table table-bordered">
				<thead>
					<h3>시설물 물량 현황 정보</h3>
				</thead>
				<tbody>
					<tr>
						<th rowspan="4" align="center">물량(단위:km)</th>
						<td colspan="2" rowspan="2" align="center">구분</td>
						<td rowspan="2" align="center">총연장</td>
						<td colspan="3" align="center">측량</td>
						<td colspan="3" align="center">비측량</td>
						<td rowspan="2" align="center">성과심사</td>
					</tr>
					<tr>
						<td align="center">실측</td>
						<td align="center">조/탐사</td>
						<td align="center">불탐</td>
						<td align="center">도면이기</td>
						<td colspan="2" align="center">기타</td>
					</tr>
					<tr>
						<td align="center">2010년 까지</td>
						<td align="center" rowspan="2">구축물량</td>
						<td align="center"><input type="text"
							value="${result.bTotal}" name="bTotal" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.bActual}" name="bActual" class="form-control" /></td>
						<td align="center"><input type="text" value="${result.bIe}"
							name="bIe" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.bIndomi}" name="bIndomi" class="form-control" /></td>
						<td align="center"><input type="text" value="${result.bUnme}"
							name="bUnme" class="form-control" /></td>
						<td align="center"><input type="text" value="${result.bEtc}"
							name="bEtc" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.bEtcEx}" name="bEtcEx" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.bEvalue}" name="bEvalue" class="form-control" /></td>
					</tr>
					<tr>
						<td align="center">2010년 이후</td>
						<td align="center" rowspan="2"><input type="text"
							value="${result.aTotal}" name="aTotal" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.aActual}" name="aActual" class="form-control" /></td>
						<td align="center"><input type="text" value="${result.aIe}"
							name="aIe" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.aIndomi}" name="aIndomi" class="form-control" /></td>
						<td align="center"><input type="text" value="${result.aUnme}"
							name="aUnme" class="form-control" /></td>
						<td align="center"><input type="text" value="${result.aEtc}"
							name="aEtc" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.aEtcEx}" name="aEtcEx" class="form-control" /></td>
						<td align="center"><input type="text"
							value="${result.aEvalue}" name="aEvalue" class="form-control" /></td>
					</tr>
				</tbody>
			</table>
			<br> <br> <br>
			<table class="table table-bordered">
				<thead>
					<h3>비 측량물량(도면이기 등) 상세</h3>
				</thead>
				<tbody>
					<tr>
						<th>객체단위 데이터 추출 가능 여부</th>
						<td><select class="form-control form-control-sm"
							name="bStatus">
								<option value="true">가능</option>
								<option value="false">불가능</option>
						</select></td>
						<td>첨부파일(비 측량 데이터)</td>
						<td>
							<div class="mb-3">
								<input class="form-control" type="file" id="formFile">
							</div>
						</td>

					</tr>
				</tbody>
			</table>
			<br> <br> <br>
			<table class="table table-bordered">
				<tbody>
					<input type='button' value='행삭제' onclick='delRow()'
						style="float: right;" />
					<input type='button' value='행추가' onclick='addRow()'
						style="float: right;" />
					<tr>
						<th>선택</th>
						<th>도면이기 물량</th>
						<th>시도</th>
						<th>시군구</th>
						<th>읍면동</th>
					</tr>
					<tr>
						<td>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckDefault">
							</div>
						</td>
						<td><input type="text" value="" /></td>
						<td><select class="form-control form-control-sm">

								<option><c:out value="${result.si}" /></option>

						</select></td>
						<td><select class="form-control form-control-sm">

								<option><c:out value="${result.gungu}" /></option>

						</select></td>
						<td><select class="form-control form-control-sm">

								<option><c:out value="${result.dong}" /></option>

						</select></td>
					</tr>

				</tbody>

			</table>
			<button id="btn_modify" type="button" class="btn_register"
				style="float: right;">수정</button>
			<button id="btn_delete" type="button" class="btn_previous"
				style="float: right;">삭제</button>
			<button id="btn_previous" type="button" class="btn_previous"
				style="float: right;">이전</button>
		</form>
	</div>
	<script type="text/javascript">
		$(document).on('click', '#btn_modify', function(e) {
			if (confirm("정말 수정하시겠습니까 ?") == true) {
				$("#viewForm").submit();
			} else {
				return;
			}
		});
		$(document).on('click', '#btn_delete', function(e) {
			if (confirm("정말 삭제하시겠습니까 ?") == true) {
				$("#viewForm").attr("action", "deleteTest.do");
				$("#viewForm").submit();
			} else {
				return;
			}
		});

		//이전 클릭 시 testList로 이동
		$("#btn_previous").click(function javascript_onclikc() {
			$(location).attr('href', 'testList.do');

		});
	</script>
</body>


</html>