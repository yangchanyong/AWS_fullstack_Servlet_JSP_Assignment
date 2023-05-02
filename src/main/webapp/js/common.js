$(document).ready(function(){
    $('.slider').bxSlider({
    // pager:false,
    controls:false,
    auto:true
   });
  });

  $(function(){
    $(".gnb > li:eq(1)").on("mouseenter focus", function() {
      $(".gnb-dropdown").stop().slideDown(150);
    }).on("mouseleave blur", function(){
      $(".gnb-dropdown").stop().slideUp(150);
    }) 
   })

