<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
	.signDiv4 > input {
		    height: 30px;
		    font-size: 12px;
		    color: #72728c;
		    font-weight: 600;
		    border: none;
		    border-radius: 0;
		    margin-bottom: 30px;
	}
</style>

    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form name="loginForm" action="/user/userLoginAction.ino" method="post">
              <h1>로그인</h1>
              <div>
                <input type="email" class="form-control" placeholder="Email" name="bs_userEmail" id="bs_userEmail" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" name="bs_userPassword" id="bs_userPassword" />
              </div>
              <div>
                <a class="btn btn-default submit" onclick="loginCheck();">로그인</a>
                <a class="reset_pass" data-toggle="modal" data-target="#passwordLost-modal" href="#" >Lost your password?</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> 회원가입 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> WelCome Bstory!</h1>
                  <p>©2018 All Rights Reserved. Bstory! <br />심심해서 만들어보는 웹 사이트</p>
                </div>
              </div>
            </form>
          </section>
        </div>

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form name="registerForm" action="/user/userSignAction.ino" method="post">
              <h1>회원가입</h1>
              <div class="signDiv1">
                <input type="text" class="form-control" placeholder="Name" name="bs_userName" id="bs_userName" />
              </div>
              <div class="signDiv2">
                <input type="email" class="form-control" placeholder="Email" name="bs_userEmail" id="bs_userEmail" />
              </div>
              <div class="signDiv3">
                <input type="password" class="form-control" placeholder="Password" name="bs_userPassword" id="bs_userPassword" />
              </div>
              <div class="signDiv4">
                <input type="text" placeholder="010" name="bs_userPhone" style="width:29%; text-align: center;"/> - <input type="text" name="bs_userPhone" style="width:32%; text-align: center;"/> - <input type="text" name="bs_userPhone" style="width:32%; text-align: center;"/>
              </div>
              <div>
                <a class="btn btn-default submit" onclick="registerForm.submit()">회원가입 하기</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> 로그인 </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> WelCome Bstory!</h1>
                  <p>©2018 All Rights Reserved. Bstory! <br />심심해서 만들어보는 웹 사이트</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
    
    
    
	<script type="text/javascript">
    
	    function loginCheck(){
	    	
	    	var userEmail = $("#bs_userEmail").val();
	    	var userPassword = $("#bs_userPassword").val();
	    	
	    	if(userEmail === null || userEmail === '' || userPassword === null || userPassword === ''){
	    		return swal("로그인 정보가 잘못 되었습니다." ,  "다시 확인 해주세요!" ,  "error" );
			}
	    	swal(userEmail+"님께서 접속 하셨습니다!" ,  "WelCome Bstory!" ,  "success" );
	    	document.loginForm.submit();
	    }

	    
    </script>