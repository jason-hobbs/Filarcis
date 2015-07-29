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
//= require jquery.purr
//= require best_in_place
//= require jquery-ui/draggable
//= require jquery-ui/droppable
//= require jquery.blockUI
//= require_tree .

$(function(){ $(document).foundation(); });

$('.best_in_place').best_in_place();

jQuery.extend($.gritter.options,{time:1000,});


$(window).bind("popstate", function() {
      $.getScript(location.href);
    });

$(document).ready(
    function() {
      $.extend($.gritter.options, {
            fade_in_speed: 100, // how fast notifications fade in (string or int)
            fade_out_speed: 100, // how fast the notices fade out
            time: 1500 // hang on the screen for...
          });

    $('.best_in_place').on("ajax:success", function () {
      location.reload();
    });


    doDraggable();
    dropDown();
    clickCheckBoxes();

    $( ".folder-nav" ).droppable({
      hoverClass: "green",
      drop: function(event, ui) {
        var n = $("input[type='checkbox']:checked").length;
        if(n > 0)
        {
          var pick = $("input[type='checkbox']:checked").map(function () {return this.value;}).get().join(",");
        }
        else
        {
          var pick = ui.draggable.attr('id');
        }
        //alert("dropped! Destination: " + $(this).attr('id') + " - Source: " + pick);
        //alert(document.URL);
        var test = document.URL;
        var testRE = test.match("projects/(.*)/contents");
        //alert(testRE[1]);
        $.ajax({
          url: "/projects/" + testRE[1] + "/contents/movefile",
          data: {
            dest: $(this).attr('id'),
            source: pick
          }
        });
      }
    });


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
      return false;
    });

    $(document).on('opened', '[data-reveal]', function () {
      $("#project_name").first().focus();
    });

    $(document).on('closed.fndtn.reveal', '[data-reveal]', function () {
      var test = document.URL;
      var testRE = test.match("projects/(.*)/contents");
      if(testRE === null){
        testRE = test.match("&query=(.*)");
        $.ajax({
          url: "/justsearch?utf8=✓&query=" + testRE[1]
        });
        //window.location.href = "/search?utf8=✓&query=" + testRE[1];
      } else {
        $.ajax({
          url: "/projects/" + testRE[1] + "/contents/justentries"
        });
      };
    });

});


function doDraggable() {
  $(".img_preview").draggable({
    cursor: "move",
    revert: "invalid" ,
    helper: function(){
      //var n = $("input[type='checkbox']:checked").length;
      var n = $("#content_ids_:checked").length;
      if(n > 0) {
        return $( "<div class='draggableHelper'>" + n + " items selected</div>" );
      }
      else
      {
        return $(this).clone();
      }},
      appendTo: 'body',
      scroll: false
    });

}

function clickCheckBoxes() {
  $('#selectall').click(function(event) {  //on click
    if(this.checked) { // check select status
      $("input:checkbox").prop("checked", true);
    }else{
      $("input:checkbox").prop("checked", false);
    }
  });
}



$(document).bind('dragover', function (e) {
    var dropZone = $('#dropzone'),
        timeout = window.dropZoneTimeout;
    if (!timeout) {
        dropZone.addClass('in');
    } else {
        clearTimeout(timeout);
    }
    var found = false,
        node = e.target;
    do {
        if (node === dropZone[0]) {
            found = true;
            break;
        }
        node = node.parentNode;
    } while (node != null);
    if (found) {
        dropZone.addClass('hover');
    } else {
        dropZone.removeClass('hover');
    }
    window.dropZoneTimeout = setTimeout(function () {
        window.dropZoneTimeout = null;
        dropZone.removeClass('in hover');
    }, 1000);
});

function dropDown() {
  $('.nav').click(function() {
    var menu = document.getElementById('dropdown_menu');

    if(menu.style.display == 'block'){
      menu.style.display = 'none';
    }else {
      menu.style.display = 'block';
    }
  });
};
