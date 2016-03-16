<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="spring"	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="welcome">
	<div class="logo"><a href="<c:url value="/"/>"><img alt="Logo" src="<c:url value="/resources/images/my-eshop.png" />"></a></div>
</div>
<div style="clear: both; height: 30px;"></div>
<div>
	<h2>Payment Review</h2>
	<table class="cartDetail reviewOrder">
		<tr>
			<td>Full Name</td>
			<td>${paymentReview.fullName}</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>${paymentReview.email}</td>
		</tr>
		<tr>
			<td>Ship to Street</td>
			<td>${paymentReview.shipToStreet}</td>
		</tr>
		<tr>
			<td>Ship to country</td>
			<td>${paymentReview.shipToCountryName}</td>
		</tr>
		
		<tr>
			<td>Total</td>
			<td>${paymentReview.amount}</td>
		</tr>
	</table>
	<div style="height: 10px"></div>
	<form action="<c:url value='/checkout/doPayment'/>" method="post">
		<button type="submit" class="btn btn-success btn-sm">Continue</button>
	</form>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $("#header").removeAttr("id");
    $("#mainContent").css("margin-left", "0");
    $("input[name='j_username']").focus();
});
</script>
