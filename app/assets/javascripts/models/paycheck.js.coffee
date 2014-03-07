class RailsThing.Models.Paycheck extends Backbone.Model

  defaults: ->
    amount: 0
    date: new Date
    period: 'month'
    lastPayed: new Date
