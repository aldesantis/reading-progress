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
      },
      beforeSend: function () {
        $('.status')
          .removeClass('status-idle status-sent status-error')
          .addClass('status-sending')
          .text('Sending...');
      },
      success: function () {
        $('.status')
          .removeClass('status-idle status-sending status-error')
          .addClass('status-sent')
          .text('Sent!');

        $.doTimeout('scroll-status', 3000, function() {
          $('.status')
            .removeClass('status-sent status-sending status-error')
            .addClass('status-idle')
            .text('Idle');
        });
      },
      error: function () {
        $('.status')
          .removeClass('status-idle status-sending status-sent')
          .addClass('status-error')
          .text('Error');

        $.doTimeout('scroll-status', 3000, function() {
          $('.status')
            .removeClass('status-sent status-sending status-error')
            .addClass('status-idle')
            .text('Idle');
        });
      }
    });
  });
});
