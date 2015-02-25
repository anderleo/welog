Router.configure
  layoutTemplate: 'layout'

Meteor.startup ->
  if Meteor.isClient
    location = Iron.Location.get()
    if location.queryObject.platformOverride
      Session.set 'platformOverride', location.queryObject.platformOverride
  return

Router.map ->
  @route 'lists',
    path: '/'
    subscriptions: ->
      Meteor.subscribe 'Posts'
      return

  @route 'forms',
    data: ->
      post: Posts.find().fetch()[0]

  @route 'postView',
    path: '/postView/:_id'
    subscriptions: ->
      Meteor.subscribe 'post', @params._id
      return
    data: ->
      Posts.findOne @params._id

  @route 'editPost',
    path: '/editPost/:_id'
    subscriptions: ->
      Meteor.subscribe 'post', @params._id
      return
    data: ->
      Posts.findOne @params._id

  @route 'actionSheet'
  @route 'addPost'
  @route 'loading'
  @route 'sideMenu'
  @route 'userAccounts'