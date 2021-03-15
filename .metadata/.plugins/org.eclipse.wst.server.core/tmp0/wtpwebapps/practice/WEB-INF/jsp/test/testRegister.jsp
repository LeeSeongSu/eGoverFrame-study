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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form action="insertTest.do" id="form_test" method="post"
			encType="multiplart/form-data">
			<table class="table table-bordered">
				<thead>
					<h3>기본정보</h3>
				</thead>
				<tbody>
					<tr>
						<th>기관</th>
						<td><select name="si" class="form-control form-control-sm">
								<c:forEach var="result" items="${si}" varStatus="status">
									<option><c:out value="${result.si}" /></option>
								</c:forEach>
						</select> <select name="gungu" class="form-control form-control-sm">
								<c:forEach var="result" items="${gungu}" varStatus="status">
									<option><c:out value="${result.gungu}" /></option>
								</c:forEach>
						</select></td>
						<th>담당자</th>
						<td><input name="name" type="text" class="form-control" /></td>
					</tr>

					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phoneNumber"
							class="form-control" /></td>
						<th>시설물</th>
						<td><select name="kinds" class="form-control form-control-sm">
								<c:forEach var="result" items="${kinds}" varStatus="status">
									<option><c:out value="${result.kinds}" /></option>
								</c:forEach>
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
						<td align="center"><input type="text" name="bTotal"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bActual"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bIe"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bIndomi"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bUnme"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bEtc"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bEtcEx"
							class="form-control" /></td>
						<td align="center"><input type="text" name="bEvalue"
							class="form-control" /></td>
					</tr>
					<tr>
						<td align="center">2010년 이후</td>
						<td align="center" rowspan="2"><input type="text"
							name="aTotal" class="form-control" /></td>
						<td align="center"><input type="text" name="aActual"
							class="form-control" /></td>
						<td align="center"><input type="text" name="aIe"
							class="form-control" /></td>
						<td align="center"><input type="text" name="aIndomi"
							class="form-control" /></td>
						<td align="center"><input type="text" name="aUnme"
							class="form-control" /></td>
						<td align="center"><input type="text" name="aEtc"
							class="form-control" /></td>
						<td align="center"><input type="text" name="aEtcEx"
							class="form-control" /></td>
						<td align="center"><input type="text" name="aEvalue"
							class="form-control" /></td>
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
						<td></td>
					</tr>
				</tbody>
			</table>
			<br> <br> <br>
			<table id="unmeTable" class="table table-bordered">
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
						<td><input type="text" /></td>

						<td><select class="form-control form-control-sm">
								<c:forEach var="result" items="${si}" varStatus="status">
									<option><c:out value="${result.si}" /></option>
								</c:forEach>
						</select></td>
						<td><select class="form-control form-control-sm">
								<c:forEach var="result" items="${gungu}" varStatus="status">
									<option><c:out value="${result.gungu}" /></option>
								</c:forEach>
						</select></td>
						<td><select class="form-control form-control-sm">
								<c:forEach var="result" items="${dong}" varStatus="status">
									<option><c:out value="${result.dong}" /></option>
								</c:forEach>
						</select></td>

					</tr>

				</tbody>

			</table>
			<button id="btn_register" type="button" class="btn_register"
				style="float: right;">등록</button>
			<button id="btn_previous" type="button" class="btn_previous"
				style="float: right;">이전</button>


		</form>

	</div>
	<script type="text/javascript">
		//글쓰기

		$(document).on('click', '#btn_register', function(e) {
			$("#form_test").submit();
		});

		//이전 클릭 시 testList로 이동
		$("#btn_previous").click(function javascript_onclikc() {
			$(location).attr('href', 'testList.do');
		});

		function addRow() {
			// table element 찾기
			const table = document.getElementById('unmeTable');

			// 새 행(Row) 추가 (테이블 중간에)
			const newRow = table.insertRow(1);

			// 새 행(Row)에 Cell 추가
			const newCell1 = newRow.insertCell(0);
			const newCell2 = newRow.insertCell(1);
			const newCell3 = newRow.insertCell(2);
			const newCell4 = newRow.insertCell(3);
			const newCell5 = newRow.insertCell(4);

			// Cell에 텍스트 추가
			newCell1.innerHTML = "<input type='checkbox'>";
			newCell2.innerHTML = "<input type='text' />";
			newCell3.innerHTML = "<select class='form-control form-control-sm'><c:forEach var='result' items='${list}' varStatus='status'><option><c:out value='${result.si}' /></option></c:forEach></select>";
			newCell4.innerHTML = "<select class='form-control form-control-sm'><c:forEach var='result' items='${list}' varStatus='status'><option><c:out value='${result.gungu}' /></option></c:forEach></select>";
			newCell5.innerHTML = "<select class='form-control form-control-sm'><c:forEach var='result' items='${list}' varStatus='status'><option><c:out value='${result.dong}' /></option></c:forEach></select>";
		}

		function delRow() {
			var tableData = document.getElementById('unmeTable');
			for (var i = 1; i < tableData.rows.length; i++) {
				var chkbox = tableData.rows[i].cells[0].childNodes[0].checked;

				if (chkbox) {
					tableData.deleteRow(i);
					i--;
				}
			}
		}
	</script>
</body>

</html>