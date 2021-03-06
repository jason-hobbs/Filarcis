# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#new_content').fileupload
    dropZone: $('#dropzone')
    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#new_content').append(data.context)
      data.submit()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.meter').css('width', progress + '%')
    done: (e, data) ->
      data.context.find('.meter').css('background', 'green')
