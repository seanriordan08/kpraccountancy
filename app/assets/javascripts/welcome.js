
$(document).ready(function(){

  $(".navbar-brand.home").on("click", function(){
    var selection = $('.view-port .home');
    show_nav_link(selection);
  });

  $(".navbar-nav a.about").on("click", function(){
    var selection = $('.view-port .about');
    show_nav_link(selection);
  });

  $(".navbar-nav a.news").on("click", function(){
    var selection = $('.view-port .news');
    show_nav_link(selection);
  });

  function show_nav_link(selection){
    $('.view-port, .footer').fadeOut(250, function(){
      setTimeout(function(){
        selection.css("display", "block");
        selection.siblings().css("display", "none");
        $('.view-port, .footer').fadeIn(200);
      }, 200);
    });
  }

});

//Typed.js
$(function(){
  $(".active-typing").typed({
    strings: ["We focus on what matters to <br>your business.", "We focus on what matters to <br>your enterprise.","We focus on what matters to <br>you."],
    typeSpeed: 10
  });
});
