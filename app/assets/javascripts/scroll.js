/*
 *= require jquery.ba-dotimeout
 */

$(window).scroll(function (e) {
  var article = $('.article-body:first').parents('.article:first');

  if (!article) {
    return false;
  }

  $.doTimeout('scroll', 2000, function() {
    var scroll = $(window).scrollTop();

    $.ajax('/articles/' + article.data('article-id') + '/position.json', {
      type: 'PUT',
      data: {
        position: {
          offset: scroll
        }
      }
    });
  });
});
