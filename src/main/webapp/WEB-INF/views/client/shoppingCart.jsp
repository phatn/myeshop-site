<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form id="shoppingCart" action="" method="post">
	<table class="cartDetail">
		<thead style="background-color: #443266; color: #fff">
			<tr>
				<th><spring:message code="nameProduct.label"/></th>
				<th><spring:message code="image.label"/></th>
				<th><spring:message code="totalPrice.label"/></th>
				<th><spring:message code="quantity.label"/></th>
				<th></th>
			</tr>
		</thead>
		
		<c:choose> 
			<c:when test="${fn:length(cart.cartItems) > 0}">
		    	<c:forEach items="${cart.cartItems}" var="item">
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
						<input type="text" name="quantities" value="${item.quantity}" style="width: 30px; text-align: center;">
						<input type="hidden" name="productIds" value="${item.product.id}"/>	
					</td>
					<td><a href="<c:url value="/cart/remove/"/>${item.product.id}"><img class="deleteCartItem" alt="" src="<c:url value="/resources/images/delete-cart-item.png" />" /></a></td>
				</tr>
				</c:forEach>
	  		</c:when>
		  	<c:otherwise>
		  		<tr>
		    	<td colspan="5"><strong><spring:message code="emptyCart.label"/></strong></td>
		    	</tr>
		  	</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="2" align="right"><spring:message code="total.label"/></td>
			<td colspan="3">${cart.grandTotal}</td>
		</tr>
	</table>
	<c:if test="${fn:length(cart.cartItems) > 0}">
		<div>
			<button id="checkoutWithPaypal" style="margin-left: 5px; margin-top: 9px;" class="cartAction btn_paypal">
				<img alt="Check out with PayPal" src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-medium.png">
				<!-- <img src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;"> -->
			</button>
			<button id="updateCart" style="margin-left: 5px" class="btn btn-success btn-sm cartAction"><spring:message code="updateCart.label"/></button>
			<a class="btn btn-success btn-sm cartAction" style="margin-left: 5px" href="<c:url value="/"/>"><spring:message code="continueShopping.label"/></a>
			<%-- <button id="checkout" style="margin-left: 5px" class="btn btn-success btn-sm cartAction"><spring:message code="checkout.label"/></button> --%>
			
		</div>
	</c:if>
	<input type="hidden" name="grandTotal" value="${ cart.grandTotal}" />
</form>
	
	
<script type="text/javascript">
$(document).ready(function() {
	hideCategoryMenu();
    
    // Handle update cart
    $("#updateCart").click(function(){
    	var updateURL = "<c:url value='/cart/update' />";
    	$("#shoppingCart").attr("action", updateURL).submit();
    	return false;
    });
    
    // Handle checkout
	$("#checkout").click(function(){
		var checkoutURL = "<c:url value='/customer/checkout' />";
		$("#shoppingCart").attr("action", checkoutURL).submit();
		return false;
    });
    
	// Handle checkout with Paypal
	$("#checkoutWithPaypal").click(function(){
		var checkoutURL = "<c:url value='/checkout/checkoutWithPaypal' />";
		$("#shoppingCart").attr("action", checkoutURL).submit();
		return false;
    });
	
});
</script>


