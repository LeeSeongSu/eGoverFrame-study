<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<c:if test="${not empty login}">
		<p>${login.userName}</p>
		    가입일자 : <fmt:formatDate value="${login.userJoinDate}"
			pattern="yyyy-MM-dd" />
		<a href="/user/logout.do" class="btn btn-default btn-flat"><i
			class="glyphicon glyphicon-log-out"></i><b> 로그아웃</b></a>
	</c:if>
	<c:if test="${empty login}">
		<p>Guest</p>
		<a href="/user/login.do" class="btn btn-default btn-flat"><i
			class="glyphicon glyphicon-log-in"></i><b> 로그인</b></a>
	</c:if>

</div>