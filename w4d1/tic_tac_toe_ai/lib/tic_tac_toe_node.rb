require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner != evaluator
    end
    # return true if @board.winner != evaluator && @board.winner != nil
    # return false if @board.over? && (@board.winner == nil || @board.winner == evaluator)

    if @next_mover_mark == evaluator
      children.all? {|child| child.losing_node?(evaluator)}
    else
      children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.winner == evaluator
    end
    
    # return true if @board.winner == evaluator
    # return false if @board.over? && @board.winner != evaluator

    if @next_mover_mark == evaluator
      children.any? {|child| child.winning_node?(evaluator)}
    else
      children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_pos = []
    (0..2).each do |row|
      (0..2).each do |col|
        empty_pos << [row, col] if @board.empty?([row, col])
      end
    end
    childrens = []
    empty_pos.each do |ele|
      new_board = @board.dup
      new_board[ele] = next_mover_mark
      new_mover_mark = nil
      next_mover_mark == :x ? new_mover_mark = :o : new_mover_mark = :x
      childrens << TicTacToeNode.new(new_board, new_mover_mark, ele)
    end
    childrens
  end
end
