# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(".completed-checkbox").bind 'change', (ev) ->
    task_id = $(this).attr('data-id');
    state = $(this).prop('checked');    
    $.post(
      'projects/task_state_change',
      { id: task_id,
      state: state },
      )



  $(".link_to_delete_task").bind 'ajax:success', ->
    $(this).parent().parent().fadeOut();


