describe 'Blackjack View', ->
  appView = null

  beforeEach ->
    appView = new AppView(model: new App())

  it "should contain the defined properties: template, events, initialize, render", ->
    expect(appView.template).toBeDefined()
    expect(appView.events).toBeDefined()
    expect(appView.initialize).toBeDefined()
    expect(appView.render).toBeDefined()