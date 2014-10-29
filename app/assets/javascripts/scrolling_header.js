$(document).ready(function(){
  var coderita = $('#coderita_navbar');
  coderita.hide();
  $(window).scroll(function(){
    var scrollTop = 200;
    if($(window).scrollTop() >= scrollTop){
      coderita.show();
    }
    if($(window).scrollTop() < scrollTop){
      coderita.hide();
      $('.Nav').removeAttr('style');  
    }
  })
});