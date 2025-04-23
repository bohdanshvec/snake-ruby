module Turns

  # добавление в массив поворотов координат нового поворота
  def change_direction(key)
    if key == "\e[A" && @pyton_arr[0][:direction] != :down
      @turns_coordinate.push({x: @pyton_arr[0][:x], y: @pyton_arr[0][:y], direction: :up})
    elsif key == "\e[B" && @pyton_arr[0][:direction] != :up
      @turns_coordinate.push({x: @pyton_arr[0][:x], y: @pyton_arr[0][:y], direction: :down})
      # binding.irb
    elsif key == "\e[C" && @pyton_arr[0][:direction] != :left
      @turns_coordinate.push({x: @pyton_arr[0][:x], y: @pyton_arr[0][:y], direction: :right})
    elsif key == "\e[D" && @pyton_arr[0][:direction] != :right
      @turns_coordinate.push({x: @pyton_arr[0][:x], y: @pyton_arr[0][:y], direction: :left})
      # binding.irb
    end
  end

end