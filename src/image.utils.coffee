
ImageUtils =
  
  # Compute the minimum and maximum pixels
  getExtent: ->
    return [@min, @max] if @min? and @max?
    
    # Set initial values for min/max
    index = @data.length
    while index--
      value = @data[index]
      continue if isNaN(value)
      
      [min, max] = [value, value]
      break
    
    # Continue loop to find extent
    while index--
      value = @data[index]
      continue if isNaN(value)
      min = value if value < min
      max = value if value > max
    
    [@min, @max] = [min, max]
    return [@min, @max]

  # Get the value of a pixel from the arraybuffer
  getPixel: (x, y, z) ->
    z = z or 0
    @offset = @begin + ((y + @height * z) * @width + x) * @bytes
    return @accessor()


@astro.FITS.ImageUtils = ImageUtils