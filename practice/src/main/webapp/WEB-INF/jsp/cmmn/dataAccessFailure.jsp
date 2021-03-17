<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isErrorPage="true" import="java.io.*" %>
<%=exception %>
<%
  out.println("<pre>");
  StringWriter sw = new StringWriter();
  PrintWriter pw = new PrintWriter(sw);
  exception.printStackTrace(pw);
  out.print(sw.toString());
  sw.close();
  pw.close();
  out.println("</pre>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Error</title>
</head>

<body>
    <spring:message code='fail.common.sql' />
</body>
</html>