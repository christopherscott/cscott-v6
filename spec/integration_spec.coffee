Zombie = require 'zombie'
chai = require 'chai'
# add chai assertions to Object.prototype
chai.should()
browser = new Zombie

HOST = "http://localhost:3000"

describe 'home page', ->

  before (done) ->
    browser.visit("#{HOST}/")
      .then(done, done)

  it 'should have the right title', ->
    browser.text('title').should.equal 'Express'
  
  it 'should have the right heading', ->
    browser.text('h1').should.equal 'Express'

  it 'should have a h1', ->
    browser.query('h1').should.exist

  it 'should have an h1', ->
    browser.queryAll('p').length.should.equal 1


describe 'about page', ->

  before (done) ->
    browser.visit("#{HOST}/about")
      .then(done, done)

  it 'should have the right title', ->
    browser.text('title').should.equal 'Express'

  it 'should have the right heading', ->
    browser.text('h1').should.equal 'About'

    
  
  
  