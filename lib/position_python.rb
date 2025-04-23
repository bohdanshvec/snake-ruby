module PositionPython
  
  # обновление координат змейки
  def update_position_python

    change_direction_segment

    delete_coordinates_turn
      
    head = @pyton_arr.first

    if eat_apple?(head)
      
      @apple_coordinate.delete({ x: head[:x], y: head[:y] })
      head_and_apple = head.dup

      update_segment_direction(head_and_apple)

      @pyton_arr.unshift(head_and_apple)
    else
      # обновляем координаты сегментов согласно их направления
      @pyton_arr.each do |segment|
        update_segment_direction(segment)
      end
    end

  end

  # меняем направление у сегментов, которые совпадают с поворотами
  def change_direction_segment
    @pyton_arr.each do |segment|
      @turns_coordinate.each do |turn|
        if segment[:x] == turn[:x] && segment[:y] == turn[:y]
          segment[:direction] = turn[:direction]
          # binding.irb
        end 
      end 
    end
  end

  # обновление координат сегмента
  def update_segment_direction(segment)
    case segment[:direction]
    when :right
      segment[:x] += 1
    when :left
      segment[:x] -= 1
    when :up
      segment[:y] -= 1
    when :down
      segment[:y] += 1
    end
  end

  # удаляем повороты, которые совпадают с последним сегментом (хвостом), весь питон прошол данный поворот
  def delete_coordinates_turn
    @turns_coordinate.reject! do |turn|
      last = @pyton_arr.last
      last[:x] == turn[:x] && last[:y] == turn[:y] && last[:direction] == turn[:direction]
    end
  end

end