<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="spring"	uri="http://www.springframework.org/tags" %>

<div class="welcome">
	<div class="logo"><a href="<c:url value="/"/>"><img alt="Logo" src="<c:url value="/resources/images/my-eshop.png" />"></a></div>
</div>
<div style="clear: both; height: 30px;"></div>
<div class="signInSection">	
	<div class="signInBox">
		<div class="panel panel-default" style="width: 60%">
			<div class="panel-heading">
				<h3	class="panel-title"><spring:message code="signin.label"/> </h3>
			</div>
			<div class="panel-body">
				<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/> <br />
					</div>
				</c:if>
				<form action="<c:url value="/customer/j_spring_security_check" />" method="post">
					<fieldset>
						<div class="form-group">
							<input class="form-control" placeholder="<spring:message code="username.label"/>" 
								name="j_username" type="text" />
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="<spring:message code="password.label"/>" 
								name="j_password" type="password" value=""/>
						</div>
						<div class="form-group">
							<input type="checkbox" name="_spring_security_remember_me" />&nbsp;<spring:message code="rememberme.label"/>
						</div>
						<div class="form-group">
							<a href="<c:url value="/forgotpassword"/> " ><spring:message code="forgot.password.label"/></a>
						</div>
						<input class="btn btn-lg btn-success btn-block" type="submit" value="<spring:message code="login.label"/>"/>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div class="newCustomerBox">
		<h2><spring:message code="newcustomers.label"/></h2>
		<span><spring:message code="newcustomers.benefit.label"/></span>
		<div style="width: 300px; margin: 0 auto; padding-top: 20px;">
			<a class="btn btn-lg btn-success btn-block" href="<c:url value="/customer/register"/> "><spring:message code="register.label"/></a>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $("#header").removeAttr("id");
    $("#mainContent").css("margin-left", "0");
    $("input[name='j_username']").focus();
});
</script>
