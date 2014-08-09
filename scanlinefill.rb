# Scanline-fill <James.Lopez at bluegod.net>
# GPLv2 License

# I've based this method on:
# http://en.wikipedia.org/wiki/Flood_fill#Scanline_fill
# Seems the most efficient way as alternatives:
# Recursion: Stack overflow problem
# Pixel by pixel: at least 1 order of magnitude less efficient.
#
# https://github.com/bluegod/scanlinefill
def fill_scanline_fast(x_coord, y_coord, oldColour, newColour)
  return if newColour == oldColour

  #Create a new stack to pop/push values up to a maximum value.
  stack = Stack.new

  #Values passed start from 1, you may need to modify this if the start from zero.
  y = x_coord - 1
  x = y_coord - 1
  stack.push([x, y])

  while (!stack.empty?)
    #Get the next value
    x,y = stack.pop
    y1 = y
    #Scan y1 to the left
    while (y1 >= 0 && @img[x][y1] == oldColour)
      y1-=1
    end

    y1+=1
    east, west = false, false

    #Fills in lines the neighbour pixels
    while (y1 < img_x && @img[x][y1] == oldColour)
      #Set new colour
      @img[x][y1] = newColour

      if (!east && x > 0 && @img[x - 1][y1] == oldColour)
        stack.push([x-1, y1])
        east = true
      elsif (east && x > 0 && @img[x - 1][y1] != oldColour)
        east = false
      end
      if (!west && x < img_y - 1 && @img[x + 1][y1] == oldColour)
        stack.push([x + 1, y1])
        west = true
      elsif (west && x < img_y - 1 && @img[x + 1][y1] != oldColour)
        west = false
      end
      y1+=1
    end
  end
end