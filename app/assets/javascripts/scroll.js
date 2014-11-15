/*
 *= require jquery.ba-dotimeout
 */

$(window).scroll(function (e) {
  var article = $('.article-body:first').parents('.article')[0];

  if (!article) {
    return false;
  }

  $.doTimeout('scroll', 2000, function() {
    var scroll = $(window).scrollTop();
    console.log(scroll);
  });
});
