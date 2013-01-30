$(document).ready ->

#validations with ketchup

  $.ketchup.messages
    required: 'Campo Obrigatório'
  $.ketchup.createErrorContainer((form, el) ->
    $("<ul/>",
      class: "error-messages"
    ).insertAfter el
  ).addErrorMessages((form, el, container, messages) ->
    container.html ""
    i = 0
    while i < messages.length
      $("<li/>",
        text: messages[i]
      ).appendTo container
      i++
  ).showErrorContainer((form, el, container) ->
    container.slideDown "fast"
  ).hideErrorContainer (form, el, container) ->
    container.slideUp "fast"

  $("#bimestralForm").ketchup validateEvents: "blur focus keyup"
  $("#semestralForm").ketchup validateEvents: "blur focus keyup"
  $("#anualForm").ketchup validateEvents: "blur focus keyup"

#function for bimestral calc

  bimestral_calc = ->
    v1 = $('#v1').val()
    v2 = $('#v2').val()
    pd = $('#pd').val()
    vm = $('#vm').val()
    total = (parseFloat(v1) + parseFloat(pd) + parseFloat(v2) + parseFloat(vm)) / 2
    if total < 60
      alert('Olá, sua notá é ' + parseFloat(total) + ' e infelizmente você não passou.' + ' Você precisa de ' + (60 - parseFloat(total)) + ' pontos para passar')
    else
      alert('Sua nota é ' + parseFloat(total) + ' parabéns, você passou !')
  $('#bimestral').click ->
    if $('#bimestralForm').ketchup('isValid')
      bimestral_calc()
    else
      el.ketchup('validate')

#function for semestral calc
  semestral_calc = ->
    b1 = $('#b1').val()
    b2 = $('#b2').val()
    total = ((parseFloat(b1) * 2) + (parseFloat(b2) * 3)) / 5
    if total < 60
      alert('Olá, sua notá é ' + parseFloat(total) + ' e infelizmente você não passou.' + ' Você precisa de ' + (60 - parseFloat(total)) + ' pontos para passar')
    else
      alert('Sua nota é ' + parseFloat(total) + ' parabéns, você passou !')
  $('#semestral').click ->
    if $('#semestralForm').ketchup('isValid')
      semestral_calc()
    else
      el.ketchup('validate')

#function for anual calc

  anual_calc = ->
    b1 = $('#b1').val()
    b2 = $('#b2').val()
    b3 = $('#b3').val()
    b4 = $('#b4').val()
    total = ((parseFloat(b1) * 2) + (parseFloat(b2) * 3) + (parseFloat(b3) * 2) + (parseFloat(b4) * 3)) / 10
    if total < 60
      alert('Olá, sua notá é ' + parseFloat(total) + ' e infelizmente você não passou.' + ' Você precisa de ' + (60 - parseFloat(total)) + ' pontos para passar')
    else
      alert('Sua nota é ' + parseFloat(total) + ' parabéns, você passou !')
  $('#anual').click ->
    if $('#anualForm').ketchup('isValid')
      anual_calc()
    else
      el.ketchup('validate')

#masks for inputs
  $('#v1').mask("99.99")
  $('#v2').mask("99.99")
  $('#pd').mask("99.99")
  $('#vm').mask("99.99")
  $('#b1').mask("99.99")
  $('#b2').mask("99.99")
  $('#b3').mask("99.99")
  $('#b4').mask("99.99")
