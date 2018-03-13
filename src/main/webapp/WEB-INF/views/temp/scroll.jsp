<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

#topAutoScroll img {max-width:50px; z-index:999; right:0px; position:fixed; bottom:0px; display: none}

</style>
<script>
   $(function(){
	   $(window).scroll(function(){
           if ($(this).scrollTop() > 600) {
              $('#topAutoScroll img').fadeIn();
              
           } else {
              $("#topAutoScroll img").fadeOut();
           }
        });
      $("#topAutoScroll img").click(function() {
         
         $('html, body').animate({scrollTop:0}, 'slow');
         return false;
         
      });
      
      
   });

</script>
</head>

<div class="row" id="topAutoScroll">
   <img src="/m1/resources/images/topAutoScroll.png">  
</div>
