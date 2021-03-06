$ ->
  # Course sorting
  courseList = new List('courses', {valueNames: ['title','characters','views','students']})

  # User sorting
  userList = new List('users', {valueNames: ['name','training','characters-ms', 'characters-us', 'edits']})

  # Article sorting
  articleList = new List('articles', {valueNames: ['title','characters','views']})

  # Revision sorting
  revisionList = new List('revisions', {valueNames: ['title', 'date', 'characters', 'views']})

  $('select.cohorts').change (e) ->
    cohort = $('select.cohorts option:selected').val()
    window.location = "/courses?cohort=" + encodeURIComponent(cohort)

  $('select.sorts').change (e) ->
    list = switch($(this).attr('rel'))
      when "courses" then courseList
      when "users" then userList
      when "articles" then articleList
      when "revisions" then revisionList
    list.sort($(this).val(), { order: $(this).children('option:selected').attr('rel') })

$.fn.extend
  toggleHeight: ->
    return @each ->
      height = '0px'
      if $(@).css('height') == undefined || $(@).css('height') == '0px'
        height = $(@).getContentHeight()
      $(@).css('height', height)

  getContentHeight: ->
    elem = $(@).clone().css(
      "height":"auto"
      "display":"block"
    ).appendTo($(@).parent())
    height = elem.css("height")
    elem.remove()
    return height