class String
  def color(text, background = :no_color)
    "\e[3#{color_code(text)}m\e[4#{color_code(background)}m#{self}\e[0m"
  end

  private

  def color_code(color)
    [:black, :red, :green, :yellow, :blue, :pink, :cyan, :white, :no_color].find_index(color)
  end
end
