// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function() {
  $("input[name='all']").click(function() { 
    var parent_to_check = $(this).attr('value');
    allInterests = [];
    allInterests = document.getElementsByName('interests[]');

    for (var i =0; i < allInterests.length; i++){
      if(allInterests[i].getAttribute('data-parent-id') == parent_to_check) {
        if(allInterests[i].checked) {
        allInterests[i].checked = false;
      } else {
        allInterests[i].checked = true;
      }
      }; 
    };
  });

  $('.messenger').on('click', function(event)
  {
    event.preventDefault();
    var messenger_id = $(this).attr('data-id');
    var callout_id = $(this).attr('data-callout');
    var url = '/callouts/get_messages';
    $.ajax({
      url: url,
      dateType: 'script',
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
  $('input[type=checkbox]').on('click', function(event){
    var self = $(this),
        interests_resort = [];
        
    // if ( self.is(':checked') ) {
    //   interests_resort.push($(this).val());
    // }

    $('input[type=checkbox]:checked').each(function(index, element) {
      interests_resort.push($(element).val());
    });
    
    $.ajax({
      url: '/callouts/sorted',
      dataType: 'script',
      data: {
        checkedinterests: interests_resort

      }
    });
  });




  // $('#reply_button').on('click', function(event)
  // {
  //   event.preventDefault();
    
  //   // var url = $(this).attr("action");
  //   var data = $(this).serialize();
  //   $.ajax({
  //     type: "POST",
  //     url: 'callouts/replies/create',
  //     dateType: 'script',
  //     data: data,
  //     success: function(result) {
  //       eval(result);
  //     }      
  //   }).done(function (data){
  //     $("textarea").val("");
  //   });
  // });


  $('#media-button').on('click', function() {
    if ($(this).parent().parent().css ('background-color') == "rgb(238, 238, 238)") {
      var foo = $('#source-registration').position().left - $('#media-registration').position().left;
      var lefty = "" + foo + "px";

      console.log(lefty);

      $(this).parent().animate (
          { left: lefty }, 
          750
        );

      $(this).parent().css (
        "z-index", "10");

      $(this).parent().parent().css (
        "background-color", "#00a6cf");
    }

    });

  $('#source-button').on('click', function() {
    if ($(this).parent().parent().css ('background-color') == "rgb(238, 238, 238)") {
      var foo = $('#media-registration').position().left - $('#source-registration').position().left;
      var lefty = "" + foo + "px";

      console.log(lefty);

      $(this).parent().animate (
          { left: lefty }, 
          750
        );

      $(this).parent().css (
        "z-index", "10");

      $(this).parent().parent().css (
        "background-color", "#49c51d");

      $(this).css (
        "cursor", "default");

      // $('.registration.buttons:hover').remove();
    }
  });

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












