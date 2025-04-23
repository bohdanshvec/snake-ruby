module SettingsGame
  # 80 X 19 field size
  SIZE_PYTHON = 6
  SLEEP_INTERVAL = 0.15
  rows, cols = IO.console.winsize

  # оставим рамки по 2 символа с каждой стороны
  FIELD_WIDTH = cols
  FIELD_HEIGHT = rows

  FIELD_WIDTH_GAMING = FIELD_WIDTH - 2
  FIELD_HEIGHT_GAMING = FIELD_HEIGHT - 4
  APPLE = 20
end
