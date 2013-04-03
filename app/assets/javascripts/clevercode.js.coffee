window.cleverCode =
  init: ->
    @page = $('header')
    @page.find('#mantra').fitText 1.2

$ ->
  cleverCode.init()
  cleverCode.home.init()
  cleverCode.work.init()
  cleverCode.contact.init()