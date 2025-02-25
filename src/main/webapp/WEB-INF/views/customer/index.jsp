<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				
				<c:forEach items="${productsData.data }" var="product">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Sale badge-->
							<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
							<!-- Product image-->
							<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">
										<a href="${base }/details/${product.seo}">${product.title }</a>
									</h5>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">
										$20.00
									</span>
									<fmt:setLocale value="vi_VN"/>
									<fmt:formatNumber value="${product.price}" type="currency"/>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<button onclick="javascript:AddToCart('${base}', ${product.id}, 1);">Add to cart</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
				<!-- <div class="col mb-5">
					<div class="card h-100">
						Sale badge
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						Product image
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						Product details
						<div class="card-body p-4">
							<div class="text-center">
								Product name
								<h5 class="fw-bolder">Special Item</h5>
								Product reviews
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								Product price
								<span class="text-muted text-decoration-line-through">$20.00</span>
								$18.00
							</div>
						</div>
						Product actions
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col mb-5">
					<div class="card h-100">
						Product image
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						Product details
						<div class="card-body p-4">
							<div class="text-center">
								Product name
								<h5 class="fw-bolder">Popular Item</h5>
								Product reviews
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								Product price
								$40.00
							</div>
						</div>
						Product actions
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="javascript:AddToCart('${base }', ${product.id}, 1);">Add to cart</a>
							</div>
						</div>
					</div>
				</div> -->

			</div>

			<!-- Paging -->
			<div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div id="paging"></div>
				</div>
			</div>

		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

	<!-- <script type="text/javascript">
		$( document ).ready(function() {
			$("#paging").pagination({
				currentPage: 3,
		        items: ${totalItems},
		        itemsOnPage: ${itemsOnPage},
		        cssStyle: 'dark-theme',
		        onPageClick: function(pageNumber, event) {
					alert(pageNumber);
				},
		    });
		});
	</script> -->

</body>
</html>
