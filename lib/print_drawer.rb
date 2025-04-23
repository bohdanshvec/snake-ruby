module PrintDrawer
  
  include SettingsGame
  # отрисовка рамки поля
  def field
    arr = []
    arr << ("-" * FIELD_WIDTH)
    FIELD_HEIGHT_GAMING.times { arr << ("|" + " " * FIELD_WIDTH_GAMING + "|") }
    arr << ("-" * FIELD_WIDTH)
    arr
  end

  # отрисовка поля с питоном
  def print_pyton

    arr_print = @arr_field.map(&:dup)

    # Обходим каждую координату тела змейки и заменяем соответствующую точку на 'o'
    @pyton_arr.each_with_index do |coord, index|
      x = coord[:x]
      y = coord[:y]

      # Заменяем пробел в строке `arr[y]` на символ 'o' на позиции x
      if index == 0
        arr_print[y][x] = "s"
      else
        arr_print[y][x] = "o"
      end
    end

    # добавляем яблоки на поле по координатам из @apple_coordinate
    @apple_coordinate.each do |apple|
      x = apple[:x]
      y = apple[:y]
      arr_print[y][x] = "@"
    end

    # добавляем барьеры на поле по координатам из @barrier_coordinate
    @barrier_coordinate.each do |barrier|
      x = barrier[:x]
      y = barrier[:y]
      arr_print[y][x] = '|'
    end

    # Печатаем поле
    arr_print.each { |line| puts line }
  end
end
