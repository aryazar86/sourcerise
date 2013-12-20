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

  heightify();

  function heightify() {
    height = "" + document.documentElement.clientHeight
    console.log(height)
    $('.inner-wrap').css (
      'height', height
      )
  }

  $(window).on('resize', function() {
    heightify();
  });

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

  

});

$(document).ready(function() {
  $('input[type=checkbox]').on('click', function(event){
    var self = $(this),
        interests_resort = [];

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

  $('input[type=checkbox]').on('click', function(event){
      var self = $(this),
        interests_resort = [];
    $('input[type=checkbox]:checked').each(function(index, element) {
      interests_resort.push($(element).val());
    });

    var url = "/callouts/callouts_count";

    $.ajax({
      url: url,
      dataType: 'script',
      data: {
        checkedinterests: interests_resort
      }
    });
  });





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

      $('#media-reg-form').css (
        "opacity", "1");

      $('#title').fadeIn().text('Great, please register!');

      $('#source-button').css (
        "opacity", "0")
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

      $('#source-reg-form').css (
        "opacity", "1");

      $('#title').fadeIn().text('Great, please register!');

      $('#media-button').css (
        "opacity", "0")
    }
  });

});












