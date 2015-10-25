
$(document).ready(function(){

  $(".navbar-brand").on("click", function(){
    show_welcome_home();
  });

  $(".navbar-nav a.about").on("click", function(){
    show_welcome_about();
  });

  function show_welcome_home(){
    $('.view-port, .footer').fadeOut(250, function(){
      setTimeout(function(){
        $('.view-port .home').css("display", "block");
        $('.view-port .about').css("display", "none");
        $('.view-port, .footer').fadeIn(200);
      }, 200);
    });
  }

  function show_welcome_about(){
    $('.view-port, .footer').fadeOut(250, function(){
      setTimeout(function(){
        $('.view-port .about').css("display", "block");
        $('.view-port .home').css("display", "none");
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
