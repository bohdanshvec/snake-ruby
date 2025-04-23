module Barrier # |

  include SettingsGame
  def generate_coordinate_barrier(pyton_arr, apple_coordinate, barrier_count)
    barrier_coordinate = []
    while barrier_coordinate.count < barrier_count
      barrier = { x: rand(1..FIELD_WIDTH_GAMING), y: rand(1..FIELD_HEIGHT_GAMING) }

      # Проверяем, что координаты не совпадают с телом змейки, яблоками и другими барьерами
      unless pyton_arr.any? { |segment| segment[:x] == barrier[:x] && segment[:y] == barrier[:y] } ||
             apple_coordinate.any? { |existing| existing[:x] == barrier[:x] && existing[:y] == barrier[:y] } ||
                barrier_coordinate.any? { |existing| existing[:x] == barrier[:x] && existing[:y] == barrier[:y] }
        barrier_coordinate << barrier
      end
    end

    barrier_coordinate
  end
end
