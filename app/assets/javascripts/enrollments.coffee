document.addEventListener "turbolinks:load", ->
  unless $("[data-behavior='athlete-enrollment-select']").data('processed')
    $("[data-behavior='athlete-enrollment-select']").data('processed', true)

    $("[data-behavior='athlete-enrollment-select']").select2
      placeholder: 'Select an Option'
      allowClear: true
      ajax:
        url: $("[data-behavior='athlete-enrollment-select']").data('url')
        dataType: 'json'
        delay: 250
        data: (params) ->
          {
            term: params.term
          }
        processResults: (data, params) ->
          console.log data
          {
            results: data
          }
        cache: true
      minimumInputLength: 0
      escapeMarkup: (markup) ->
        markup
      templateResult: (highSchool) ->
        highSchool.name || "Searching..."
      templateSelection: (highSchool) ->
        highSchool.name

    $("[data-behavior='athlete-enrollment-select']").on 'select2:select', (event) ->
      window.evnt = event
      if event.params.data.id == -1
        console.log "reveal new hs form"
        $("[data-behavior='athlete-enrollment-search']").hide()
        $("[data-behavior='athlete-enrollment-add-high-school']").show()
      else
        console.log "enable submit button"
        # continue as normal, enable submit button

    $("[data-behavior='athlete-enrollment-cancel']").on 'click', (event) ->
      event.preventDefault()
      $("[data-behavior='athlete-enrollment-search']").show()
      $("[data-behavior='athlete-enrollment-add-high-school']").hide()
      $("[data-behavior='athlete-enrollment-select']").val(null).trigger('change') # clears existing selection

    $("#new_high_school").on("ajax:success", (e, data, status, xhr) ->
      e.preventDefault()

      console.log data
    ).on("ajax:error", (e, data, status, xhr) ->
        console.log data
    )
