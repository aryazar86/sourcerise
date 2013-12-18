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

  $('#media-button').on('click', function() {

    var foo = $('#source-registration').position().left - $('#media-registration').position().left;
    var lefty = "" + foo + "px";

    console.log(lefty);

    $(this).parent().animate (
        { left: lefty }, 
        750
      );

    $(this).parent().css (
      "z-index", "10");

      // half = (window.innerWidth / 2);

      //  $('#slideleft').animate ({
      //     left: half.toString()
      // }, 1500);
      //console.log("HERE");
    });

  $('#source-button').on('click', function() {

    var foo = $('#media-registration').position().left - $('#source-registration').position().left;
    var lefty = "" + foo + "px";

    console.log(lefty);

    $(this).parent().animate (
        { left: lefty }, 
        750
      );

    $(this).parent().css (
      "z-index", "10");
  });
});

