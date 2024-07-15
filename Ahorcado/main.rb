require 'json'

class Hangman
  MAX_INCORRECT_GUESSES = 6

  def initialize
    @dictionary = load_dictionary
    @secret_word = select_secret_word
    @correct_guesses = Array.new(@secret_word.length, '_')
    @incorrect_guesses = []
  end

  def load_dictionary
    File.read('google-10000-english-no-swears.txt').split("\n").select do |word|
      word.length >= 5 && word.length <= 12
    end
  end

  def select_secret_word
    @dictionary.sample
  end

  def play
    until game_over?
      display_game_status
      guess = get_player_guess
      process_guess(guess)
    end

    display_game_status
    if won?
      puts "¡Felicidades, ganaste! La palabra era #{@secret_word}."
    else
      puts "Lo siento, perdiste. La palabra era #{@secret_word}."
    end
  end

  def display_game_status
    puts "\nPalabra: #{@correct_guesses.join(' ')}"
    puts "Letras incorrectas: #{@incorrect_guesses.join(', ')}"
    puts "Te quedan #{MAX_INCORRECT_GUESSES - @incorrect_guesses.size} conjeturas incorrectas."
  end

  def get_player_guess
    puts "Ingresa una letra para adivinar o 'guardar' para guardar el juego:"
    guess = gets.chomp.downcase
    if guess == 'guardar'
      save_game
      puts "Juego guardado. ¡Hasta la próxima!"
      exit
    end
    guess
  end

  def process_guess(guess)
    if @secret_word.include?(guess)
      @secret_word.chars.each_with_index do |char, index|
        @correct_guesses[index] = char if char == guess
      end
    else
      @incorrect_guesses << guess unless @incorrect_guesses.include?(guess)
    end
  end

  def game_over?
    won? || lost?
  end

  def won?
    !@correct_guesses.include?('_')
  end

  def lost?
    @incorrect_guesses.size >= MAX_INCORRECT_GUESSES
  end

  def save_game
    File.open('saved_game.json', 'w') do |file|
      file.puts JSON.generate({
        secret_word: @secret_word,
        correct_guesses: @correct_guesses,
        incorrect_guesses: @incorrect_guesses
      })
    end
  end

  def self.load_game
    if File.exist?('saved_game.json')
      data = JSON.parse(File.read('saved_game.json'))
      game = self.new
      game.instance_variable_set(:@secret_word, data['secret_word'])
      game.instance_variable_set(:@correct_guesses, data['correct_guesses'])
      game.instance_variable_set(:@incorrect_guesses, data['incorrect_guesses'])
      game
    else
      puts "No hay juegos guardados."
      nil
    end
  end
end

def main_menu
  puts "Bienvenido a Hangman"
  puts "1. Nuevo juego"
  puts "2. Cargar juego guardado"
  choice = gets.chomp.to_i

  case choice
  when 1
    game = Hangman.new
    game.play
  when 2
    game = Hangman.load_game
    game.play if game
  else
    puts "Opción no válida"
  end
end

main_menu
