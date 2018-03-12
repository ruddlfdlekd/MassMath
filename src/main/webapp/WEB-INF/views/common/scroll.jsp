<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

#topAutoScroll img {max-width:50px; z-index:999; position:fixed; bottom:0px; right:0px; display:none;}

</style>
<script>
   $(function(){
      $(window).scroll(function(){
            if ($(this).scrollTop() > 600) {
               $('#topAutoScroll img').fadeIn();
               
            } else {
               $('#topAutoScroll img').fadeOut(function(){
                  
               $('#topAutoScroll img').css("top","890px");
               });
            }
         });
      $("#topAutoScroll img").click(function() {
         
         $('html, body').animate({scrollTop:0}, 'slow');
         $("#topAutoScroll img").animate({top: '64px'}, 'slow');
         
         return false;
         
      });
      
      
   })

</script>
</head>


<div id=topAutoScroll>
   <img src="m1/images/common/로켓.png">
</div>

</html>