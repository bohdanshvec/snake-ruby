class BaseLevel
  include Apple
  include Barrier

  def initialize(barrier_count: 0, apples_dynamic: true)
    @barrier_count = barrier_count
    @apples_dynamic = apples_dynamic
  end

  def barrier(pyton_arr, apple_coordinate)
    generate_coordinate_barrier(pyton_arr, apple_coordinate, @barrier_count)
  end

  def apple_appear(apple_coordinate, pyton_arr)
    return if !@apples_dynamic

    generate_coordinate_apple(apple_coordinate, pyton_arr)
  end
end