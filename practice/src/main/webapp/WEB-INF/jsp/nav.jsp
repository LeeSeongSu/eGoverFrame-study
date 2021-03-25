<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul>
	<li><a href="/testList.do">목록</a></li>
	<li><a href="/testRegister.do">글 작성</a></li>
	<li><c:if test="${not empty login}">
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <img
					src="/${login.userImg}" class="user-image" alt="User Image">
					<span class="hidden-xs">${login.userName}</span>
			</a>
				<ul class="dropdown-menu">
					<li class="user-header"><img src="/${login.userImg}"
						class="img-circle" alt="User Image">
						<p>${login.userName}
							<small> 가입일자 : <fmt:formatDate
									value="${login.userJoinDate}" pattern="yyyy-MM-dd" />
							</small>
						</p></li>
					<li class="user-body">
						<div class="row">
							<div class="col-xs-4 text-center">
								<a href="#">게시글</a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#">추천글</a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#">북마크</a>
							</div>
						</div>
					</li>
					<li class="user-footer">
						<div class="pull-left">
							<a href="${path}/user/info" class="btn btn-default btn-flat"><i
								class="fa fa-info-circle"></i><b> 내 프로필</b></a>
						</div>
						<div class="pull-right">
							<a href="${path}/user/logout" class="btn btn-default btn-flat"><i
								class="glyphicon glyphicon-log-out"></i><b> 로그아웃</b></a>
						</div>
					</li>
				</ul></li>
		</c:if></li>
	<li><c:if test="${empty login}">
			<li class="dropdown user user-menu"><span class="hidden-xs">회원가입
					또는 로그인</span>

				<li class="dropdown-menu">
					<li class="user-header"><img src="/dist/img/default-user.png"
						class="img-circle" alt="User Image">
						<p>
							<b>회원가입 또는 로그인해주세요</b> <small></small>
						</p></li>
					<li class="user-footer">
						<div class="pull-left">
							<a href="register.do" class="btn btn-default btn-flat"><i
								class="fa fa-user-plus"></i><b> 회원가입</b></a>
						</div>
						<div class="pull-right">
							<a href="login.do" class="btn btn-default btn-flat"><i
								class="glyphicon glyphicon-log-in"></i><b> 로그인</b></a>
						</div>
					</li>
				</li>
		</c:if></li>
</ul>