require_relative 'tic_tac_toe_node'
require "byebug"

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    node_children = node.children
    node_children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end
    node_children.each do |child|
      return child.prev_move_pos if !child.losing_node?(mark)
    end
    node_children.each do |child|
      return child.prev_move_pos if child.children.none? do |grandchild|
        grandchild.board.won?
      end
    end
    raise "Unfair game!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new
  # debugger

  TicTacToe.new(hp, cp).run
end
