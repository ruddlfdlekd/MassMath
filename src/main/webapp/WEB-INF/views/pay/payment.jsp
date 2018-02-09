<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../resources/css/payment.css" rel="stylesheet" >
<style type="text/css">
 




</style>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment.proxy.js"></script>
<script type="text/javascript">

$(function(){
	var method ="";

$("#select1").click(function(){
	
	method=$(this).attr("title");
	
	alert(method);
});
$("#select2").click(function(){
	method=$(this).attr("title");
	alert(method);
});

$(".jsx-2606617993 ").click(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init("imp78293916"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	 
	    pay_method : method,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : ${amount},
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' 
	        + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	       
	        
	    }
	    alert(msg);
	    location.href="./pay3";
		});
	});	
});
</script>
</head>
<body>

<div id="app">
<div data-reactroot="" class="jsx-1217026723">


<section class="jsx-3280580650">
<div class="jsx-3280580650 content-background">
<div class="jsx-3280580650 content-wrapper">
<h3 class="jsx-3280580650">
<div class="Inquery">
<h1>수학 교육의 스마트한 동반자 </h1>
<h2>MASS MATH</h2>
</div>




<button id="select1" value="card" title="card" style="background: rgba(62, 62, 62, 0.2);  ">

<p id="p" class="jsx-4237515084"  style="color: rgb(255, 255, 255);  font-weight: 1000;">신용카드결제</p></button>

<button id="select2" value="phone" title="phone" style="background: rgba(62, 62, 62, 0.2);">

<p id="p" class="jsx-4237515084" style="color: rgb(255, 255, 255); font-weight: 1000;">핸드폰결제</p></button>



<div class="jsx-3280580650 payment-btn-wrapper">
<button role="button" aria-label="Button" class="jsx-2606617993" style="color: rgb(255, 255, 255); font-size: 1.2rem; width: 100%; height: 61px; border-radius: 30px; cursor: pointer; outline: none; font-family: &quot;Noto Sans KR&quot;, sans-serif; z-index: 900; background: rgb(81, 159, 229); max-width: 320px; border: none; "><!-- react-empty: 1275 --><!-- react-empty: 1276 --><!-- react-text: 1277 -->결제하기<!-- /react-text --></button></div></div></div><div class="jsx-3280580650 payment-terms-background"><div class="jsx-3280580650 payment-terms-wrapper"><h4 class="jsx-3280580650">이용안내 및 유의사항</h4><p class="jsx-3280580650">결제 및 환불 안내</p><ul class="jsx-3280580650"><li class="jsx-3280580650">결제 후 7일 이내,  푼 문제 기록이 100문제 이하 일 경우 고객센터를 통해 100% 환불이 가능합니다.</li><li class="jsx-3280580650">100문제는 진단고사 30문제를 제외한 문제입니다.</li><li class="jsx-3280580650">결제일로부터 7일 이후에는 환불이 불가합니다.</li><li class="jsx-3280580650">환불 규정에 따라, 환불 접수일로부터 최대 7일 이내에 환불 처리됩니다.</li></ul><h4 class="jsx-3280580650">수강기간 및 수강조건</h4><p class="jsx-3280580650">프리패스 상품</p><ul class="jsx-3280580650"><li class="jsx-3280580650">결제와 동시에 학습이 시작되며 2개월의 수강기간은 60일, 6개월의 수강기간은 180일, 12개월의 수강기간은 365일 입니다.</li><li class="jsx-3280580650">00:00:00~23:59:59(대한민국 표준시간 기준)을 1일로 인정합니다.</li><li class="jsx-3280580650">수강 기간이 끝나도, 푼 문제와 학습한 강의/노트는 오답노트에서 복습이 가능합니다.</li></ul><p class="jsx-3280580650">컨텐츠 구매 상품</p><ul class="jsx-3280580650"><li class="jsx-3280580650">학습시작 후 맞춤문제로 제공된 문제 2,000개까지 학습할 수 있습니다.</li><li class="jsx-3280580650">맞춤문제 2,000개를 풀 때 제공되는 맞춤 강의와 노트는 맞춤 문제 2,000개 소진완료와 함께 제공이 중단됩니다. 다만, 맞춤문제를 모두 소진하여도 미뤄둔 학습, 마이노트에서 확인할 수 있는 문제, 강의 및 노트는 확인이 가능합니다.</li><li class="jsx-3280580650">맞춤학습 2,000개는 진단고사로 제공되는 문제가 불 포함된 개수입니다.</li></ul><p class="jsx-3280580650">공통</p><ul class="jsx-3280580650"><li class="jsx-3280580650">본 수강권은 타인에게 양도 및 재판매가 불가하며, 양도 및 재판매 발견 시 학습 ID는 정지됩니다.</li><li class="jsx-3280580650">유의사항은 회사 사정에 따라 변경될 수 있으며, 미숙지로 인한 불이익에 대해 책임지지 않습니다.</li><li class="jsx-3280580650">그외의 상황에서는 당사의 약관을 따릅니다.</li></ul><h4 class="jsx-3280580650">결제 관련 문의사항</h4><p class="jsx-3280580650">support@riiid.co</p></div></div></section></div></div></div></div></div></div>









</div>
</body>
</html>