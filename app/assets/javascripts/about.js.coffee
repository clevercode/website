cleverCode.about = 

  init: ->
    @page = $('#content.about')
    @attachEventListeners()

  attachEventListeners: ->
    @page.on 'click', '.person a', $.proxy @, '_onPersonClick'

  _onPersonClick: (event) ->
    $this = $(event.currentTarget)
    $person = $this.parent()
    @name = $this.prop 'class'
    @page.find('.person-double').hide()
    @page.find('.person-bio').hide 'fast'
    @page.find(".person-bio.#{@name}").show 'fast'
    $personDouble = @page.find(".person-double.#{@name}")
    $personDouble.css display: 'block'

    switch @name
      when 'olivier' then $personDouble.css top: '0px', left: '0px'
      when 'andrew' then $personDouble.css top: '0px', right: '0px'
      when 'zachary' then $personDouble.css left: '0px', bottom: '0px'
      when 'alyssa' then $personDouble.css right: '0px', bottom: '0px'

    $personDouble.animate
      opacity: 1
      width: '100%'

    $(window).one 'click', $.proxy @, '_onWindowClick'
    false

  _onWindowClick: ->
    @page.find('.person-bio').hide 'fast'
    width = @page.find(".person a.#{@name}").parent().width()
    @page.find(".person-double.#{@name}").animate
      opacity: 0
      width: width
    , =>
      @page.find('.person-double').hide()

