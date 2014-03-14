class RailsThing.Views.Envelope extends RailsThing.View

  tagName: 'li'

  template: JST['envelopes/envelope']

  initialize: ->
    _.bindAll

    @model.bind 'change', @render
    @model.bind 'remove', @unrender

    window.wad.bind 'change', @render

  render: =>
    $(@el).html @template( @model.attributes )

    @

  unrender: =>
    $(@el).remove()

  collect: ->
    $(@el).addClass('collect')
    @$('.collect_input').focus()

  pay: ->
    $(@el).addClass('pay')
    @$('.pay_input').focus()

  inputKeyPress: (e) ->
    @doneCollecting() if e.keyCode is 13

  payKeyPress: (e) ->
    @donePaying() if e.keyCode is 13

  doneCollecting: ->
    @doneSomething(@model, window.wad, 'collect')

  donePaying: ->
    @doneSomething(window.wad, @model, 'pay')

  removeSafely: ->
    @transfer(@model, window.wad)

    @model.destroy()

  events:
    'click .collect': 'collect'
    'click .pay': 'pay'
    'click .submit_collect': 'doneCollecting'
    'click .submit_pay': 'donePaying'
    'click .delete': 'removeSafely'
    'keypress .collect_input': 'inputKeyPress'
    'keypress .pay_input': 'payKeyPress'