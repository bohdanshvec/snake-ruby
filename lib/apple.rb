module Apple # 🍎

  include SettingsGame
  def generate_coordinate_apple(apple_coordinate, pyton_arr)

    while apple_coordinate.count < APPLE
      apple = { x: rand(1..FIELD_WIDTH_GAMING), y: rand(1..FIELD_HEIGHT_GAMING) }

      # Проверяем, что координаты не совпадают с телом змейки и другими яблоками
      unless pyton_arr.any? { |segment| segment[:x] == apple[:x] && segment[:y] == apple[:y] } ||
            apple_coordinate.any? { |existing| existing[:x] == apple[:x] && existing[:y] == apple[:y] }

        apple_coordinate << apple
      end
    end

  end

  def eat_apple?(head)
    @apple_coordinate.any? do |apple|
      head[:x] == apple[:x] && head[:y] == apple[:y]
    end
  end

end