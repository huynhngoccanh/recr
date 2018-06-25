document.addEventListener "turbolinks:load", ->
  unless $("[data-behavior='multiple-select']").hasClass('select2-hidden-accessible')
    $("[data-behavior='multiple-select']").select2
      width: "150px"

  unless $("[data-behavior='tagged-positions']").hasClass('select2-hidden-accessible')
    $("[data-behavior='tagged-positions']").select2
      width: "450px"
      placeholder: "Tag Positions"

  unless $("#address_state").hasClass('select2-hidden-accessible')
    $("#address_state").select2
      placeholder: "State"
      width: "400px"
      tags: true
