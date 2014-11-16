/*
 *= require jquery.ba-dotimeout
 */

var initialScroll = false;

$(window).scroll(function (e) {
  console.log(initialScroll);

  if (initialScroll) {
    return false;
  }

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

$(window).load(function() {
  var article = $('.article-body:first').parents('.article:first');

  if (!article) {
    return false;
  };

  $.getJSON('/articles/' + article.data('article-id') + '/position.json', function (data) {
    initialScroll = true;

    $('body').scrollTop(data.position.offset);

    setTimeout(function () {
      initialScroll = false;
    }, 100);
  });
});
