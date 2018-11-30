<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String Ctx = request.getContextPath();
%>
	<!-- ***** Search Form Area ***** -->
    <div class="dorne-search-form d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-close-btn" id="closeBtn">
                        <i class="pe-7s-close-circle" aria-hidden="true"></i>
                    </div>
                    <form action="#" method="get">
                        <input type="search" name="caviarSearch" id="search" placeholder="Search Your Desire Destinations or Events">
                        <input type="submit" class="d-none" value="submit">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Header Area Start ***** -->
    <header class="header_area" id="header" style="background: black;">
        <div class="container-fluid h-100">
            <div class="row h-100">
                <div class="col-12 h-100">
                    <nav class="h-100 navbar navbar-expand-lg">
                        <a class="navbar-brand" href="/main/index.ino"><img src="<%=Ctx %>/resources/img/core-img/20181102_logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        <div class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item active">
                                    <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Explore <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="/main/index.ino">Home</a>
                                        <a class="dropdown-item" href="/main/explore.ino">Explore</a>
                                        <a class="dropdown-item" href="/main/listing.ino">Listing</a>
                                        <a class="dropdown-item" href="/main/singleListing.ino">Single Listing</a>
                                        <a class="dropdown-item" href="/main/contact.ino">Contact</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Board <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="/board/boardList.ino">Board</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Listings <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                        <a class="dropdown-item" href="/main/index.ino">Home</a>
                                        <a class="dropdown-item" href="/main/explore.ino">Explore</a>
                                        <a class="dropdown-item" href="/main/listing.ino">Listing</a>
                                        <a class="dropdown-item" href="/main/singleListing.ino">Single Listing</a>
                                        <a class="dropdown-item" href="/main/contact.ino">Contact</a>
                                    </div>
                                </li>
                            </ul>
                            <!-- Search btn -->
                            <div class="dorne-search-btn">
                                <a id="search-btn" href="#"><i class="fa fa-search" aria-hidden="true"></i> Search</a>
                            </div>
                            <!-- Signin btn -->
                            <div class="dorne-signin-btn" data-toggle="modal" data-target="#myModal">
                            	<c:choose>
                            		<c:when test="${sessionScope.userEmail == null}">
                            			<a href="#">Sign in  or Register</a>
                            		</c:when>
                            		<c:otherwise>
                            			<span><a class="dropdown-item" href="/user/userLogout.ino">${sessionScope.userEmail } 접속중</a></span>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                            <!-- Add listings btn -->
                            <div class="dorne-add-listings-btn">
                                <a href="#" class="btn dorne-btn">+ Add Listings</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
    
    <script type="text/javascript">
    
	    function loginCheck(){
	    	
	    	var userEmail = $("#bs_userEmail").val();
	    	var userPassword = $("#bs_userPassword").val();
	    	
	    	if(userEmail === null || userEmail === '' || userPassword === null || userPassword === ''){
	    		return swal("로그인 정보가 잘못 되었습니다." ,  "다시 확인 해주세요!" ,  "error" );
			}
			else {
				swal(userEmail+"님께서 접속 하셨습니다!" ,  "WelCome Bstory!" ,  "success" );
			}
	    }

	    
    </script>
    
    
    