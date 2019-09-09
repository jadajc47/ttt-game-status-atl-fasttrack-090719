# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6] #right diagonal
  ]
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

#won?
def won?(board)
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
end 
WIN_COMBINATIONS.each do |win_combination|
win_index_1 = win_combination[0]
win_index_2 = win_combination[1]
win_index_3 = win_combination[2]

position_1 = board[win_index_1] 
position_2 = board[win_index_2]
position_3 = board[win_index_3]

if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  return false
end

def full?(board)
  if board.include?(' ') || board.include?('')
    return false
else
    return true
  end
end

#IS THERE A DRAW?
def draw?(board)
  if !won?(board) && full?(board)
    return false
  end
end

#HAS SOMETHING HAPPENED?
def over?(board)
  puts 'is it over?'
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    puts 'no keep going'
    return false
  end
end

#WHO WON?
def winner(board)
  if !won?(board)
    return nil
  else WIN_COMBINATIONS.each do |win_combo|
    if check_win_combination?(board, 'X', win_combo)
      return 'X'
    elsif check_win_combination?(board, 'O', win_combo)
      return 'O'
    end
  end
end
end


def play(board)
  until over?(board) == true || won?(board) != false
  puts 'turn'
    turn(board)
  end
  if winner(board)
    puts "Congratulations!"
  elsif draw?(board)
    puts "Draw!"
  else
    return nil
  end
end