
$(document).ready(function(){

  $('.news_container').slick({
    speed: 500,
    autoplay: true,
    draggable: true,
    arrows: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true
  });

});

//Typed.js
$(function(){
  $(".active-typing").typed({
    strings: ["We focus on what matters<br> to your business.", "We focus on what matters<br> to your enterprise.","We focus on what matters<br> to you."],
    typeSpeed: 10
  });
});
