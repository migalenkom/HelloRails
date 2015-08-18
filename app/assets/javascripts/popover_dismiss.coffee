$(document).ready ->
  $('[data-toggle="popover"]').popover()
  $('body').on 'click', (e) ->
    console.log 11
    $('[data-toggle="popover"]').each ->
      if !$(this).is(e.target) and $(this).has(e.target).length == 0 and $('.popover').has(e.target).length == 0
        $(this).popover 'destroy'
      return
    return
  return