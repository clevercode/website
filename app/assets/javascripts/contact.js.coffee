cleverCode.contact =
  init: ->
    @page = $('#content.contact')
    return unless @page.length
    @attachEventListeners()
    @page.find('#cleverContact_name').focus()

  attachEventListeners: ->
    @page.on 'focus', 'input, textarea', $.proxy @, '_onInputFocus'
    @page.on 'blur', 'input, textarea', $.proxy @, '_onInputBlur'
    @page.on 'submit', 'form', $.proxy @, '_onFormSubmit'

  # event handlers
  # 

  _onInputFocus: (event) ->
    $(event.currentTarget).parent().addClass 'focus'

  _onInputBlur: (event) ->
    $input = $(event.currentTarget)
    $input.parent().removeClass 'focus completed error'
    if $input.val().length > 0
      $input.parent().addClass 'completed'

  _onFormSubmit: (event) ->
    @page.find('li.action input').prop 'disabled', 'disabled'
    $inputs = @page.find 'li.input input, li.input textarea'
    for input in $inputs
      $input = $(input)

      if $input.val().length is 0
        $input.focus().parent().addClass 'error'
        @page.find('li.action input').removeAttr 'disabled'
        return no

    @_sendEmail $(event.currentTarget).serializeArray()
    off

  # private
  # 

  _sendEmail: (data) ->
    name    = _.find data, (item) -> -1 < item.name.search 'name'
    email   = _.find data, (item) -> -1 < item.name.search 'email'
    message = _.find data, (item) -> -1 < item.name.search 'message'
    params  = {
      name: name.value, email: email.value, message: message.value
    }

    call = $.ajax
      url: '/send_cleverContact'
      type: 'post'
      dataType: 'json'
      data: params

    call.done (data) => @page.find('form').css opacity: 0
    call.fail (data) => @page.find('li.action input').removeAttr 'disabled'
