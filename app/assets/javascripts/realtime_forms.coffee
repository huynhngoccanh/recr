$(document).on "change","[data-realtime]", ->
  if $(this).data('remote')
    $(this).trigger("submit.rails")
  else
    this.submit()

window.animateSave = (element) ->
    element.css({backgroundColor: '#20af64'}).animate({backgroundColor: "white"}, 500)
