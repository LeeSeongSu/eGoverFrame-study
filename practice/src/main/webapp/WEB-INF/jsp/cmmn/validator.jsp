<%@ page language="java" contentType="javascript/x-javascript" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
<validator:javascript dynamicJavascript="false" staticJavascript="true"/>