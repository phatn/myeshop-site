<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib prefix="spring"	uri="http://www.springframework.org/tags" %>
<tiles:importAttribute name="cssList"/><tiles:importAttribute name="jsList"/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" />
		<c:forEach items="${cssList}" var="cssValue">
			<link href="<c:url value ='${cssValue}'/>" rel="stylesheet" type="text/css">
		</c:forEach>
		<c:forEach items="${jsList}" var="jsValue">
			<script src="<c:url value ='${jsValue}'/>"></script>
		</c:forEach>
		<title><tiles:insertAttribute name="title" /></title>
	</head>
	<body>
		<div id="wrapper">
			<div id="topBar">
				<tiles:insertAttribute name="topBar" />
			</div>
			<div id="header">
				<tiles:insertAttribute name="header" />
			</div>
			<div id="mainContent">
				<div id="topBanners">
					<div id="topLeftBanner">
						<tiles:insertAttribute name="topLeftBanner" />
					</div>
					<div id="topRightBanner">
						<tiles:insertAttribute name="topRightBanner" />
					</div>
				</div>
				<div id="content">
					<tiles:insertAttribute name="mainContent" />
				</div>
			</div>
			<div id="footer">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</body>
</html>