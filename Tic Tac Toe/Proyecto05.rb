}def initialize_board
board = [[" ", " ", " "],
         [" ", " ", " "],
         [" ", " ", " "]]
board
end

def display_board(board)
board.each do |row|
  puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
end
end

def is_valid_move?(board, position)
row = (position - 1) / 3
col = (position - 1) % 3
board[row][col] == " "
end

def make_move(board, position, player)
row = (position - 1) / 3
col = (position - 1) % 3
board[row][col] = player
end

def get_player_move(board)
puts "Ingresa tu posición (1-9):"
position = gets.chomp.to_i
until is_valid_move?(board, position)
  puts "Posición inválida. Ingresa de nuevo:"
  position = gets.chomp.to_i
end
position
end

def check_win(board, player)
winning_combinations = [
  [board[0][0], board[0][1], board[0][2]],
  [board[1][0], board[1][1], board[1][2]],
  [board[2][0], board[2][1], board[2][2]],
  [board[0][0], board[1][0], board[2][0]],
  [board[0][1], board[1][1], board[2][1]],
  [board[0][2], board[1][2], board[2][2]],
  [board[0][0], board[1][1], board[2][2]],
  [board[0][2], board[1][1], board[2][0]]
]

winning_combinations.each do |combination|
  if combination.all? { |x| x == player }
    return true
  end
end
false
end

def is_board_full?(board)
board.flatten.all? { |x| x != " " }
end

def play_game
board = initialize_board
current_player = "X"

loop do
  display_board(board)
  puts "Turno de jugador #{current_player}:"
  position = get_player_move(board)
  make_move(board, position, current_player)

  if check_win(board, current_player)
    display_board(board)
    puts "**¡Jugador #{current_player} gana!**"
    break
  end

  if is_board_full?(board)
    display_board(board)
    puts "**¡Empate!**"
    break
  end

  current_player = (current_player == "X") ? "O" : "X"
end
end

play_game
