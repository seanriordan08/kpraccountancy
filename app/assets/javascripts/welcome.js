$(document).scroll(function(){
  $('.top-bar-container').toggleClass('scrolled', $(this).scrollTop() > 1);
});