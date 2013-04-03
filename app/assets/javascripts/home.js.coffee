cleverCode.home = 
  PROJECTS: [
    'ruby-heroes'
    'roomies'
    'firehouse'
    'feedpage'
  ]

  init: ->
    @page = $('#content.home')
    return unless @page.length
    @page.find('.team h1').slabText
      resizeThrottleTime: 100

    @attachEventListeners()
    @_initSlider()

  attachEventListeners: ->
    @page.on 'click', 'ul.gallery > li', $.proxy @, '_onGalleryClick'

  # event handlers
  # 

  _onGalleryClick: (event) ->
    project = @PROJECTS[@_slider.i]
    window.location = '/work#' + project

  # private
  # 

  _initSlider: ->
    slider = @page.find('.image-container').unslider
      arrows: true
      delay: 3000
      dots:  true
      fluid: true
      keys:  true
      pause: true

    @_slider = slider.data 'unslider'
    