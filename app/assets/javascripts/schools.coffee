document.addEventListener "turbolinks:load", ->
  unless $('#school_type').data('processed')
    $('#school_type').data('processed', true)
    $('#school_type').on 'change', ->
      selection = this.options[this.selectedIndex].value
      if selection == "HighSchool"
        $("[data-behavior='college-division-select']").css(display:'none')
        $("[data-behavior='high-school-enrollment-select']").css(display:'block')
      else
        $("[data-behavior='high-school-enrollment-select']").css(display:'none')
        $("[data-behavior='college-division-select']").css(display:'block')
    .trigger('change')
