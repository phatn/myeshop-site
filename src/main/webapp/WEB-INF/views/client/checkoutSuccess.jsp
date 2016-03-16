<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="spring"	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="welcome">
	<div class="logo"><a href="<c:url value="/"/>"><img alt="Logo" src="<c:url value="/resources/images/my-eshop.png" />"></a></div>
</div>
<div style="clear: both; height: 30px;"></div>
<div>
	<h1>Thank you! Your order is complete.</h1>
	<p>An order confirmation will be sent to: ${email} </p>
	<div style="height: 10px"></div>
	<a class="btn btn-success btn-sm" href="<c:url value='/'/>">Continue shopping</a>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $("#header").removeAttr("id");
    $("#mainContent").css("margin-left", "0");
    $("input[name='j_username']").focus();
});
</script>
