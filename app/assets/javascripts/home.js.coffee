cleverCode.home = 
  init: ->
    @page = $('#content.home')
    @page.find('#mantra').fitText 1.1
    @attachEventListeners()
    @initSlider()

  attachEventListeners: ->

  initSlider: ->
    @page.find('.gallery-slider').miniSlider
      delay: 5000
      containerClass: 'gallery-container'
      showNavigation: false

    