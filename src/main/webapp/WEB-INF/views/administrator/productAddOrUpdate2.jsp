<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<!-- directive SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
    </head>
    <body>
         <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
             <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                 <jsp:include page="/WEB-INF/views/administrator/layout/menu.jsp"></jsp:include>
                <!-- Page content-->
               <div class="container-fluid">	
               <a class="btn btn-outline-primary mb-1" href="${base}/admin/product/list" role="button">Add New</a>
                  	<h1 class="mt-4">Add/Upadte Products</h1>
                    <p>

						<sf:form  id="contact-form" method="post" action="${base}/admin/product/addOrUpdate2" modelAttribute="product" enctype="multipart/form-data">
	
							<!-- XÃ¡c Äá»nh lÃ  thÃªm má»i hay chá»nh sá»­a -->
							<sf:hidden path="id"/>
	
							<div class="form-group">
								<label for="category">Category (required)</label>
								<sf:select path="categories.id" class="form-control" id="category">
									<sf:options items="${categories }" itemValue="id" itemLabel="name" />
								</sf:select>
							</div>
							<div class="form-group">
								<label for="title">Title (required)</label>
								<sf:input path="title" autocomplete="off" type="text" class="form-control" id="title" placeholder="Title" required="required"></sf:input>
							</div>
							<div class="form-group">
								<label for="price">Price (required)</label>
								<sf:input type="number" autocomplete="off" path="price" class="form-control" id="price" placeholder="Price" required="required"></sf:input>
							</div>
							
							<div class="form-group">
								<label for="priceSale">Price Sale (required)</label>
								<sf:input type="number" autocomplete="off" path="priceSale" class="form-control" id="priceSale" placeholder="Price sale" required="required"></sf:input>
							</div>
							
							<div class="form-group">
								<label for="short_description">Description (required)</label>
								<sf:textarea autocomplete="off" path="shortDes" class="form-control" placeholder="Short Description" id="short_description" rows="3" required="required"></sf:textarea>
							</div>
							
							<div class="form-group">
								<label for="detail_description">Details (required)</label>
								<sf:textarea autocomplete="off" path="details" class="form-control summernote" id="detail_description" rows="3" required="required"></sf:textarea>
							</div>
						
							<a href="/admin/list-product" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
							<a class="btn btn-primary" onclick="document.getElementById('contact-form').submit();">Send</a>
							
						</sf:form>

					</p>           
                    
               </div>
           </div>
        </div>
       	<!-- Bootstrap core JS-->
      	 <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
    </body>
</html>
