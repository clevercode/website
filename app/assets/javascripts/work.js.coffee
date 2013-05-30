cleverCode.work =
  PROJECTS: [
    'professionals'
    'unlock-her-freedom'
    'ruby-heroes'
    'roomies'
    'firehouse'
    'feedpage'
  ]

  init: ->
    @page = $('#content.work')
    return unless @page.length
    @attachEventListeners()
    @_initSlider()
    @_navigateToSlide()

  attachEventListeners: ->

  _initSlider: ->
    slider = @page.find('.image-container').unslider
      arrows: true
      delay:  false
      dots:   true
      fluid:  true
      keys:   true
      pause:  true
      before: $.proxy @, '_beforeSliderTransition'
      after:  $.proxy @, '_afterSliderTransition'

    @_slider  = slider.data 'unslider'
    @_slider.stop()

  _beforeSliderTransition: ->
    @_project = @PROJECTS[@_slider.i]
    @page.find('.case-study').attr 'data-project', @_project

  _afterSliderTransition: ->
    window.location.hash = @_project

  _navigateToSlide: ->
    setTimeout =>
      project = window.location.hash.replace '#', ''
      if @PROJECTS.indexOf(project) isnt -1
        @_slider.to @PROJECTS.indexOf project
    , 1100
