require 'colorize'

# Constantes del juego
COLORS = %w[rojo verde azul amarillo naranja magenta cian blanco]
CODE_LENGTH = 4  
MAX_ATTEMPTS = 10 

def initialize_game
  secret_code = COLORS.sample(CODE_LENGTH).map(&:colorize)

  attempts = []

  attempts, secret_code
end

def display_code(code)
  puts "Código: #{code.join(' ')}"
end

def get_player_guess
  puts "Ingresa tu intento (4 colores separados por espacios):"
  guess = gets.chomp.split(' ').map(&:strip).map(&:colorize)

  # Validar la entrada del jugador
  until valid_guess?(guess)
    puts "Intento inválido. Ingresa 4 colores válidos separados por espacios:"
    guess = gets.chomp.split(' ').map(&:strip).map(&:colorize)
  end

  guess
end

def valid_guess?(guess)
  guess.length == CODE_LENGTH && guess.all? { |color| COLORS.include?(color) }
end

def evaluate_guess(secret_code, guess)
  # Contar toros y vacas
  bulls = 0
  cows = 0

  guess.each_with_index do |color, i|
    if color == secret_code[i]
      bulls += 1
    elsif secret_code.include?(color)
      cows += 1
    end
  end

  { bulls: bulls, cows: cows }
end

def display_results(guess, evaluation)
  puts "Tu intento: #{guess.join(' ')}"
  puts "Toros: #{evaluation[:bulls]}"
  puts "Vacas: #{evaluation[:cows]}"
end

def play_game
  attempts, secret_code = initialize_game

  attempts.each_with_index do |guess, i|
    guess = get_player_guess
    evaluation = evaluate_guess(secret_code, guess)
    display_results(guess, evaluation)

    if evaluation[:bulls] == CODE_LENGTH
      puts "**¡Felicidades! Has adivinado el código secreto en #{i + 1} intentos.**"
      break
    end

    if i == MAX_ATTEMPTS - 1
      puts "**Te quedaste sin intentos.** El código secreto era: #{secret_code.join(' ')}"
    end
  end
end

play_game


## NO VERIFICADO SI SIRVE