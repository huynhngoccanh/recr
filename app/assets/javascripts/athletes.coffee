class @StatCountUp
  constructor: (item) ->
    @item = $(item)
    new CountUp(@item.attr('id'), 0, @item.data('value'), 0, 2).start()

class @Revealer
  constructor: (item) ->
    @item = $(item)
    @item.on "click", (event) =>
      event.preventDefault()
      target().toggle()

    target = =>
      id = "#" + @item.data("target")
      $(id)

$(document).on "turbolinks:load", ->
  $("[data-behavior='count-up']").each (index, element) ->
    new StatCountUp $(element)

  new Revealer $("[data-behavior='revealer']")
