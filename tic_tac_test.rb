def default_board
  [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

def print_board(array)
  row_1 = '______________________'
  row_2 = '       |       |   '
  puts row_2
  puts "   #{array[0]}   |   #{array[1]}   |   #{array[2]}"
  puts row_2
  puts row_1
  puts row_2
  puts "   #{array[3]}   |   #{array[4]}   |   #{array[5]}"
  puts row_2
  puts row_1
  puts row_2
  puts "   #{array[6]}   |   #{array[7]}   |   #{array[8]}"
  puts row_2
end

def start_game
  system 'clear'
  puts 'Welcome to Tic-Tac-Toe!'
  puts
  puts
end

def get_input
  player_a = 'X'
  player_b = 'O'
  board = default_board
  players = [player_a, player_b].cycle

  loop do
    puts
    print_board(board)
    puts
    puts 'To play, please enter an integer from 1-9'
    puts 'To quit, please hit any key.'
    input = gets.to_i
    if input <= 0 || input > 9
      puts 'Are you sure you want to quit? Press N to cancel.'
      puts
      answer = gets.chomp.upcase
      if answer != 'N'
        system 'clear'
        puts
        puts
        puts 'Thanks for playing. Goodbye.'
        puts
        exit
      end
    else
      if !board.include?(input) #checks if the square is already taken
        system 'clear'
        puts "Square #{input} is already taken, please choose another square."
        puts
      else
        board[input-1] = players.next #updates my board
        win_combo = [
          [board[0],board[1],board[2]],#updates my winning combo
          [board[0],board[3],board[6]],
          [board[0],board[4],board[8]],
          [board[1],board[4],board[7]],
          [board[2],board[5],board[8]],
          [board[2],board[4],board[6]],
          [board[3],board[4],board[5]],
          [board[6],board[7],board[8]],        ]
        puts
        puts
        if win_combo #checks if there is a winner
          if win_combo.include?(['O','O','O'])
            system 'clear'
            puts
            print_board(board)
            puts
            puts 'Player B wins!'
            puts
            puts 'Thanks for playing. Goodbye.'
            puts
            exit
          elsif win_combo.include?(['X','X','X'])
            system 'clear'
            puts
            print_board(board)
            puts
            puts 'Player A wins!'
            puts
            puts 'Thanks for playing. Goodbye.'
            puts
            exit
          end
        end
        if board.all? { |x| x.class == String }#checks if all squares are taken
          system 'clear'
          puts
          print_board(board)
          puts 'Draw!'
          puts 'Thanks for playing. Goodbye.'
          puts
          exit
        end
      end
    end
  end
end

def run_game
  start_game
  while True get_input
  end
end

run_game
