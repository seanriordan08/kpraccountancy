
$(document).ready(function(){
  var about_general = $('.about_general');
  var about_general_heading_img = $('.about_general .heading .image_container');
  var about_general_content = $('.about_general_content');

  set_default_about_content();

  $('.about_stats ul li').click(function(){
    set_tab_actions($(this));
  });

  $('.social').click(function(){
    const url = 'https://www.linkedin.com/in/kpr-accountancy-3257a110a';
    const social_footer_link = $(this).attr('class');
    const social_about_tab = $(this).children().first();

    if (social_footer_link == 'linked_in'){
      window.open(url, '_blank');
    } else if (social_about_tab.hasClass('linked_in')){
      if (!social_about_tab.hasClass('extended')){
        social_about_tab.addClass('extended');
        window.open(url, '_blank');
      } else {
        social_about_tab.removeClass('extended');
      }
    }
  });

  $("#nav_services").click(function() {
    $('html, body').animate({
      scrollTop: $("#section_services").offset().top - 50
    }, 500);
  });

  $("#nav_about").click(function() {
    $('html, body').animate({
      scrollTop: $("#section_about").offset().top - 50
    }, 500);
  });

  $("#nav_pricing").click(function() {
    $('html, body').animate({
      scrollTop: $("#section_pricing").offset().top - 50
    }, 400);
  });

  function set_default_about_content(){
    const about_icon_default = '<img src="/assets/Information-wht.svg" width="60" height="60" alt="Small Business Success">';
    const about_title_default = 'Small Business Success';
    general_content = $('#general_content').html();
    replace_about_heading_icon(about_icon_default);
    replace_about_heading_title(about_title_default);
    $('.about_general_content').empty().append(general_content);
  }
  function fill_about_content(object){
    const about_icon = object.children().first().clone();
    const about_title = object.children().first().attr('alt');
    const about_content = $('#' + object.attr('class') + '_content').html();
    replace_about_heading_icon(about_icon);
    replace_about_heading_title(about_title);
    about_general_content.empty().append(about_content);
  }
  function set_tab_actions(object){
    const selected_icon = object.children().first();
    if (object.width() == 40){
      object.animate({width: "+=50px"}, 100);
      $(selected_icon).delay(40).animate({paddingLeft: "+=50px"}, 200);
      fill_about_content(object);
      close_remaining_tabs(object);
    } else {
      close_this_tab(object);
      set_default_about_content();
    }
  }
  function close_remaining_tabs(tab){
    tab.siblings().each(function(){
      if ($(this).width() > 40) {
        close_this_tab($(this));
      }
    })
  }
  function close_this_tab(tab){
    const selected_icon = tab.children().first();
    tab.animate({width: "-=50px"}, 100);
    $(selected_icon).animate({paddingLeft: "-=50px"}, 200);
  }
  function replace_about_heading_icon(about_icon){
    $('.about_general .heading .image_container img').remove();
    about_general_heading_img.prepend(about_icon);
  }
  function replace_about_heading_title(about_title){
    $('.about_general .heading .heading_title').empty().text(about_title);
  }

  $('.news_slider').slick({
    speed: 500,
    autoplay: true,
    draggable: true,
    arrows: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true
  });

  $('.active-typing').typed({
    strings: ["We focus on what matters<br> to your business.", "We focus on what matters<br> to your enterprise.","We focus on what matters<br> to you."],
    typeSpeed: 10
  });

  $('#hamburger-menu').click(function(){
    $(this).toggleClass('open');
    $('.nav').fadeToggle(100);
  });
});

$(document).bind("ajax:error", function(e,jqXHR,ajaxSettings,thrownError){
  if (jqXHR.status == 401){
    window.location.replace(this);
  }
});