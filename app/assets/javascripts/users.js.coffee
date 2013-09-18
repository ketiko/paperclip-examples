# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

jQuery ->
  boundx = null
  boundy = null

  showPreview = (coords) =>
    if (parseInt(coords.w) > 0)
      rx = 300 / coords.w
      ry = 300 / coords.h

      $('.preview img').css
        width: Math.round(rx * boundx) + 'px',
        height: Math.round(ry * boundy) + 'px',
        marginLeft: '-' + Math.round(rx * coords.x) + 'px',
        marginTop: '-' + Math.round(ry * coords.y) + 'px'

  $('.cropper').Jcrop({
      onChange: showPreview,
      onSelect: showPreview,
      aspectRatio: 1
    },
    ->
      bounds = this.getBounds()
      boundx = bounds[0]
      boundy = bounds[1]
  )
