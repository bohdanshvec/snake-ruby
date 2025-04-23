require "io/console"
require_relative "lib/settings_game"
require_relative "lib/print_drawer"
require_relative "lib/get_pressed_key"
require_relative "lib/turns"
require_relative "lib/position_python"
require_relative "lib/apple"
require_relative "lib/barrier"
require_relative "levels/base_level"
require_relative "levels/level_one"
require_relative "levels/level_two"
require_relative "levels/level_three"
require_relative "levels/level_four"

class GamePython
  include PrintDrawer
  include GetPressedKey
  include Turns
  include PositionPython
  include Apple
  include Barrier
  include SettingsGame

  def initialize(level:)
    @time_start = Time.now
    @level = load_level(level)
    @arr_field = field
    @pyton_arr = initial_snake
    @turns_coordinate = []
    @apple_coordinate = []
    generate_coordinate_apple(@apple_coordinate, @pyton_arr)
    @barrier_coordinate = @level.barrier(@pyton_arr, @apple_coordinate)
  end

  def run
    loop do
      @level.apple_appear(@apple_coordinate, @pyton_arr)

      print_and_wait

      key = get_pressed_key
      change_direction(key)

      update_position_python

      case check_collisions
      when :self
        game_over("вы врезались в себя")
        break
      when :barrier
        game_over("вы врезались в препятствие")
        break
      when :out_of_bounds
        game_over("вы вышли за поле")
        break
      end
    end
  end

  private

  def load_level(level)
    case level
    when 1 then LevelOne.new
    when 2 then LevelTwo.new
    when 3 then LevelThree.new
    when 4 then LevelFour.new
    else raise "Вы ввели несуществующий уровень"
    end
  end

  def initial_snake
    (1..SIZE_PYTHON).map { |i| { x: (SIZE_PYTHON + 1) - i, y: 1, direction: :right } }
  end

  def print_and_wait
    system "clear"
    print_pyton
    sleep SLEEP_INTERVAL
  end

  def check_collisions
    head = @pyton_arr.first
    body = @pyton_arr[1..]

    return :self if body.any? { |s| s[:x] == head[:x] && s[:y] == head[:y] }
    return :barrier if @barrier_coordinate.any? { |b| b[:x] == head[:x] && b[:y] == head[:y] }
    return :out_of_bounds if head[:y] < 1 || head[:y] > FIELD_HEIGHT_GAMING || head[:x] < 1 || head[:x] > FIELD_WIDTH_GAMING

    nil
  end

  def game_over(reason)
    print "Game Over, #{reason}."
    puts " Ваш счёт: #{@pyton_arr.size - SIZE_PYTHON}, вы играли #{(Time.now - @time_start).round} секунд"
  end
end

def choose_level
  system "clear"
  levels = {
    1 => "Простой – появится 20 яблок на поле",
    2 => "Усложнённый – 20 яблок на поле и они будут постоянно появляться",
    3 => "Сложный – на поле есть 20 яблок и 15 препятствий, яблоки постоянно появляются",
    4 => "Самый сложный – на поле 20 яблок и 30 препятствий,яблоки постоянно появляются"
  }

  puts '!!! ВАЖНО: Поле подогнано под размер вашего терминала'
  puts
  puts "Выберите уровень сложности:"
  levels.each { |key, description| puts "#{key} - #{description}" }

  print "Введите номер уровня: "
  level = gets.to_i

  until levels.key?(level)
    print "Неверный ввод. Повторите: "
    level = gets.to_i
  end

  level
end

level = choose_level
game = GamePython.new(level: level)
game.run


# binding.irb
