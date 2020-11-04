<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" name="files" value= "${fileName}">
<a href="./fileDelete?fileName=${fileName}"><img class="img-circle" alt="Cinque Terre" width="100" height="100" src="${pageContext.request.contextPath}/resources/upload/lost/${fileName}"></a>