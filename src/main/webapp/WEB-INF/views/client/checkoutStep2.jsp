<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="spring"	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="welcome">
	<div class="logo"><a href="<c:url value="/"/>"><img alt="Logo" src="<c:url value="/resources/images/my-eshop.png" />"></a></div>
	<div class="checkoutStep"><spring:message code="checkout.step2.label" /></div>
</div>
<div style="clear: both; height: 30px;"></div>
<h1>Review Order</h1>
<div>
	<h2>Customer information</h2>
	<form id="checkoutOrder" action="" method="post">
	<table class="cartDetail reviewOrder">
		<tr>
			<td>First Name</td>
			<td>${order.customer.firstName}</td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td>${order.customer.lastName}</td>
		</tr>
		<tr>
			<td>User Name</td>
			<td>${order.customer.userName}</td>
		</tr>
		
		<tr>
			<td>Email Address</td>
			<td>${order.customer.emailAddress}</td>
		</tr>
	</table>
</form>
</div>
<c:if test="${DELIVERY_ADDRESS == 'delivery'}">
	<div style="clear: both; height: 30px;"></div>
	<div>
		<h2>Delivery Address information</h2>
		<form id="checkoutOrder" action="" method="post">
			<table class="cartDetail reviewOrder">
					<tr>
						<td>First Name</td>
						<td>${order.customer.delivery.firstName}</td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td>${order.customer.delivery.lastName}</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>${order.customer.delivery.address}</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>${order.customer.delivery.phone}</td>
					</tr>
				</table>
		
	</form>
	</div>
</c:if>
<div>
	<%-- <c:url var="submitPaypal" value="/checkout/paypal" /> --%>
	<%-- <form action="${submitPaypal}" method="post"> --%>
	<h2>Order details</h2>
	<table class="cartDetail" style="margin-bottom: 5px;">
		<thead style="background-color: #443266; color: #fff">
			<tr>
				<th><spring:message code="nameProduct.label"/></th>
				<th><spring:message code="image.label"/></th>
				<th><spring:message code="totalPrice.label"/></th>
				<th><spring:message code="quantity.label"/></th>
			</tr>
		</thead>
		<c:forEach items="${order.orderLines}" var="item">
		<tr>
			<td>${item.product.attributeName.attributeValue.value}</td>
			<td><img width="65px" alt="" src="<c:url value="/resources/images/uploads/products/small/${item.product.smallImage.image}"/>"></td>
			<td>
				<c:choose>
					<c:when test="${item.quantity > 1}">
						${item.totalPrice}<br/>
						(${item.product.productPrice} each)
					</c:when>
					<c:otherwise>
						${item.totalPrice}
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				${item.quantity}
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="2" align="right"><spring:message code="total.label"/></td>
			<td colspan="3">${order.grandTotal}</td>
		</tr>
		</table>
	<c:url var="submitPaypal" value="https://www.sandbox.paypal.com/cgi-bin/webscr" />
	<form action="${submitPaypal}" method="post">
		
	<input type="hidden" name="business" value="phatnguyentanit@gmail.com">
	<input type="hidden" name="cmd" value="_xclick">
	<input type="hidden" name="item_name" value="Hot Sauce-12 oz. Bottle">
	<input type="hidden" name="amount" value="5.95">
	<input type="hidden" name="currency_code" value="USD">
	<input type="hidden" name="return" value="http://localhost:8080/payment/success">
	<input type="hidden" name="rm" value="2">
	<input type="hidden" name="cancel_return" value="http://localhost:8080/payment/return.html"> 
		<!-- <button type="submit" class="btn_paypal"><img src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;" alt="Check out with PayPal" /></button> -->
		<button type="submit" class="btn_paypal"><img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal" /></button>
	</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $("#header").removeAttr("id");
    $("#mainContent").css("margin-left", "0");
});
</script>
