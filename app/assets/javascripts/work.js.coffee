cleverCode.work = 
  init: ->
    @page = $('#content.work')
    @attachEventListeners()
    @initSlider()

  attachEventListeners: ->

  initSlider: ->
    @page.find('.gallery-slider').miniSlider
      delay: 5000
      containerClass: 'gallery-container'
      showNavigation: false
      onTransition: $.proxy @, 'onSliderTransition'

  onSliderTransition: (slide, number) ->
    project = slide.prop 'id'
    @page.find('h1').text project.split('-').join ' '

