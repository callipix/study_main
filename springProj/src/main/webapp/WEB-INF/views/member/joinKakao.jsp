<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<a id="kakao-login-btn"></a>
	<button class="api-btn" onclick="unlinkApp()">로그아웃</button> 
	<div id="result"></div>
	
<script type="text/javascript">
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function(res) {
        alert('success: ' + JSON.stringify(res))
      },
      fail: function(err) {
        alert('fail: ' + JSON.stringify(err))
      },
    })
  }
</script>

<script type="text/javascript">
Kakao.init('cad3b7bcccf1d223b9d90752e2d3c559'); //JavaScript 키입력
console.log(Kakao.isInitialized());

  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(result) {
          $('#result').append(result);
          id = result.id
          connected_at = result.connected_at
          kakao_account = result.kakao_account
          $('#result').append(kakao_account);
          resultdiv="<h2>로그인 성공 !!"
          resultdiv += '<h4>id: '+id+'<h4>'
          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
          name = "";
          age = "";
          email ="";
          gender = "";
          birthday = "";
          phone_number = "";
//           profile_nickname = "";
          if(typeof kakao_account != 'undefined'){ //받을 데이터 추가 및 삭제
        	  email = kakao_account.email;
        	  gender = kakao_account.gender;
        	  name = kakao_account.name;
        	  age = kakao_account.age_range;
        	  birthyear = kakao_account.birthyear;
        	  birthday = kakao_account.birthday;
        	  phone_number = kakao_account.phone_number;
//         	  profile_nickname = kakao_account.profile_nickname;
          }
          
          resultdiv += '<h4>이름(name): '+name+'<h4>'
          resultdiv += '<h4>연령대(age): '+age+'<h4>'
          resultdiv += '<h4>이메일(email): '+email+'<h4>'
          resultdiv += '<h4>성별(gender): '+gender+'<h4>'
          resultdiv += '<h4>출생연도(birthyear): '+birthyear+'<h4>'
          resultdiv += '<h4>생일(birthday): '+birthday+'<h4>'
          resultdiv += '<h4>전화번호(	phone_number): '+phone_number+'<h4>'
//           resultdiv += '<h4>닉네임(nickname): '+profile_nickname+'<h4>'
          $('#result').append(resultdiv);
          
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
</body>
</html>
