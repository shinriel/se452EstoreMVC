
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        EStore: Cart
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="<c:url value="/resources/css/font-awesome.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/animate.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/owl.carousel.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/owl.theme.css" />" rel="stylesheet">


    <!-- theme stylesheet -->
    <link href="<c:url value="/resources/css/style.default.css" />" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

    <script src="<c:url value="/resources/js/respond.min.js" />"></script>

    <link rel="shortcut icon" href="favicon.png">



</head>

<body>
	
	<c:set var="totalItems" value="${0}" />
	<c:forEach items="${cart.items}" var="item">
		<c:set var="totalItems" value="${totalItems+item.quantity}" />
	</c:forEach>
	
	<%@ include file="/WEB-INF/header.jsp"%>
	
    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Shopping cart</li>
                    </ul>
                </div>

                <div class="col-md-9" id="basket">

                    <div class="box">

                        <form method="post" action="checkout1.html">

                            <h1>Shopping cart</h1>
                            <c:choose>
                            	<c:when test="${totalItems==0}">
                            		<p>Your cart is empty.</p>
                                </c:when>
                            	
								<c:when test="${totalItems>0}">   
                            		<p class="text-muted">You currently have <c:out value="${totalItems}" /> item(s) in your cart.</p>
                            		<div class="table-responsive">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th colspan="2">Product</th>
	                                            <th>Quantity</th>
	                                            <th>Unit price</th>
	                                            <th colspan="2">Total</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    
	                                    	<c:forEach items="${cart.items}" var="item">
		                                        <tr>
		                                            <td>
		                                                <a href="#">
		                                                    <img src="img/detailsquare.jpg" alt="White Blouse Armani">
		                                                </a>
		                                            </td>
		                                            <td><a href="#"><c:out value="${item.product.description}" /></a>
		                                            </td>
		                                            <td>
		                                                <input type="number" value="<c:out value="${item.quantity}" />" class="form-control">
		                                            </td>
		                                            <td><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${item.product.price}" /></td>
		                                            <td><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${item.product.price * item.quantity}" /></td>
		                                            <td><a href="<c:url value="/cart/remove/${item.product.id}"/> "><i class="fa fa-trash-o"></i></a>
		                                            </td>
		                                        </tr>
		                                    </c:forEach>  
	                                    </tbody>
	                                    
	                                    <c:if test="${totalItems>0}">
		                                    <tfoot>
		                                        <tr>
		                                            <th colspan="5">Subtotal</th>
		                                            <th colspan="2"><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${cart.total}" /></th>
		                                        </tr>
		                                    </tfoot>
		                                </c:if> 
	                                </table>
	                                </div>
								</c:when>
								
							</c:choose>
							
							
                            <!-- /.table-responsive -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="<c:url value="/products"/>" class="btn btn-default"><i class="fa fa-chevron-left"></i> Continue shopping</a>
                                </div>
                                <div class="pull-right">
                                    <button class="btn btn-default"><i class="fa fa-refresh"></i> Update basket</button>
                                    <button type="submit" class="btn btn-primary">Proceed to checkout <i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>

                        </form>

                    </div>
                    <!-- /.box -->





                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3">
                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>Order summary</h3>
                        </div>
                        <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Order subtotal</td>
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${cart.total}" /></th>
                                    </tr>
                                    <tr>
                                        <td>Shipping and handling</td>
                                        <c:set var="shippingAmount" value="${10}" />
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${shippingAmount}" /></th>
                                    </tr>
                                    <tr>
                                        <td>Tax</td>
                                        <c:set var="taxAmount" value="${cart.total*0.0625}" />
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${taxAmount}" /></th>
                                    </tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <c:set var="totalAmount" value="${cart.total+taxAmount+shippingAmount}" />
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${totalAmount}" /></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>




                </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

        <!-- *** FOOTER ***

		<%@ include file="/WEB-INF/footer.jsp" %>

        <!-- *** FOOTER END *** -->

    </div>
 
    <!-- *** SCRIPTS TO INCLUDE ***-->

 	<%@ include file="/WEB-INF/scripts.jsp" %>


</body>

</html>