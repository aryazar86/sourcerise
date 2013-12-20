
$(document).ready(function() {
  $('.messenger').on('click', function(event)
  {
    event.preventDefault();
    var messenger_id = $(this).attr('data-id');
    var callout_id = $(this).attr('data-callout');
    var url = '/callouts/get_messages';
    $.ajax({
      url: url,
      dataType: 'script',
      data: {
        messengerid: messenger_id,
        calloutid: callout_id
      },
      success: function(result) {
        eval(result);
      }
    });
  });
  
});

$(document).ready(function() {
  $('#reply_comment').on("keyup", function(){
      var remaining = 300 - $(this).val().length;
      $('.countdown').text(remaining + ' characters remaining.');
      if(remaining >= 0){
        $('input[type="submit"]').removeAttr('disabled');
      } else {
        $('input[type="submit"]').attr('disabled', 'disabled');
      }
    });
});
$(document).ajaxComplete(function() {
  $('#reply_comment').on("keyup", function(){
      var remaining = 300 - $(this).val().length;
      $('.countdown').text(remaining + ' characters remaining.');
      if(remaining >= 0){
        $('input[type="submit"]').removeAttr('disabled');
      } else {
        $('input[type="submit"]').attr('disabled', 'disabled');
      }
    });
});