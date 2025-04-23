module GetPressedKey

  include SettingsGame
  
  # получение нажатой клавиши поворота
  def get_pressed_key
    input = nil
    begin
      system('stty raw -echo')  # Переключаем терминал в raw-режим
      if IO.select([STDIN], nil, nil, SLEEP_INTERVAL)
        input = STDIN.getc.chr  # Считываем первый символ
        if input == "\e"        # Если это ESC, возможно, это начало последовательности
          input << STDIN.read_nonblock(2) rescue nil  # Считываем следующие два символа
        end
      else
        input = nil  # Если время ожидания истекло, возвращаем nil
      end
    ensure
      system('stty -raw echo')    # Возвращаем терминал в обычный режим
    end
    input
  end

end