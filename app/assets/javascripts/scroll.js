/*
 *= require jquery.ba-dotimeout
 */

var initialScroll = false;

$(function() {
  setStatus('idle');
});

$(function() {
  var article = $('.article-body:first').parents('.article:first');

  if (article.length < 1) {
    return false;
  };

  $.getJSON('/articles/' + article.data('article-id') + '/position.json', function (data) {
    initialScroll = true;

    $('body').scrollTop(data.position.offset);

    setStatus('loaded');

    setTimeout(function () {
      initialScroll = false;
    }, 100);
  });
});

$(window).scroll(function (e) {
  if (initialScroll) {
    return false;
  }

  var article = $('.article-body:first').parents('.article:first');

  if (article.length < 1) {
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
        setStatus('sending');
      },
      success: function () {
        setStatus('sent');
      },
      error: function () {
        setStatus('error');
      }
    });
  });
});

function setStatus(status)
{
  var text;

  switch (status) {
    case 'idle':
      text = 'Idle';
      break;

    case 'sending':
      text = 'Sending...';
      break;

    case 'sent':
      text = 'Sent!';
      break;

    case 'error':
      text = 'Error';
      break;

    case 'loaded':
      text = 'Loaded!';
      break;
  }

  $('.status')
    .removeClass('status-idle status-sending status-sent status-loaded status-error')
    .addClass('status-' + status)
    .text(text);

  if (status != 'idle') {
    $.doTimeout('scroll-status', 3000, function() {
      setStatus('idle');
    });
  }
}
