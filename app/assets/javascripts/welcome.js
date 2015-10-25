
$(document).ready(function(){

  $(".navbar-nav a.about").click(function(){
    $('.view-port').addClass("fade");
    $('.home').css("display", "none");
    $('.about').css("display", "block");
    $('.view-port').addClass("fade in");
  });

});

//Typed.js
$(function(){
  $(".active-typing").typed({
    strings: ["We focus on what matters to <br>your business.", "We focus on what matters to <br>your enterprise.","We focus on what matters to <br>you."],
    typeSpeed: 10
  });
});
