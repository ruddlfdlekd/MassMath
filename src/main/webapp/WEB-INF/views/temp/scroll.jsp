<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

#topAutoScroll img {max-width:50px; z-index:999; position:fixed; bottom:0px; right:50px; display: none}

</style>
<script>
   $(function(){
	   $(window).scroll(function(){
           if ($(this).scrollTop() > 600) {
              $('#topAutoScroll img').fadeIn();
              
           } else {
              $('#topAutoScroll img').fadeOut(function(){
                 
              $('#topAutoScroll img').css("top","890px");
              $('#topAutoScroll img').css("right","50px");
              });
           }
        });
      $("#topAutoScroll img").click(function() {
         
         $('html, body').animate({scrollTop:0}, 'slow');
         return false;
         
      });
      
      
   });

</script>
</head>

<div class="row" id=topAutoScroll>
 <div class="col-sm-10">
 </div>
 <div class="col-sm-2">
   <img src="/m1/resources/images/topAutoScroll.png">  
 </div>
</div>

</html>