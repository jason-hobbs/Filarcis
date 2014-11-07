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
//= require jquery.turbolinks
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require gritter
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require_tree .

$(function(){ $(document).foundation(); });


$(document).ready(
    function() {
      $.extend($.gritter.options, {
            fade_in_speed: 100, // how fast notifications fade in (string or int)
            fade_out_speed: 100, // how fast the notices fade out
            time: 1500 // hang on the screen for...
          });

    //$('.folder-nav').click(function()
    //{
      //$('.folder-nav').removeClass('folder-nav-active');
      //$(this).addClass('folder-nav-active');
    //});

    $('.highlight').click(function()
    {
      $('.folder-nav').removeClass('folder-nav-active');
      $(this).parent().addClass('folder-nav-active');
    });

    $('.arrow').click(function()
    {
      var origsrc = $(this).find('img').attr('src');
      //alert(origsrc);
      var src = '';
      if (origsrc == '/images/arrow-closed.png')
         src = '/images/arrow-open.png';
      else
         src = '/images/arrow-closed.png';
      $(this).find('img').attr('src', src);


      $(this).parent().next().toggle();
    });

});
