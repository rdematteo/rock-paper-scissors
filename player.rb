# frozen_string_literal: true

class Player
  MOVES = %i[rock paper scissors].freeze

  attr_reader :score, :move, :name
  attr_writer :name

  def initialize
    @score = 0
    @move = nil
    @name = 'Player 1'
  end

  def player_move
    loop do
      puts 'Pick a move'
      puts 'Rock, Paper or Scissors'
      print '> '
      @move = gets.chomp.strip.downcase.to_sym # convert string to symbol eg :rock
      return false if @move == :quit
      return @move if MOVES.include?(@move)

      puts 'Invalid move. Try Rock, Paper or Scissors'
    end
  end

  def win
    @score += 1
  end
end
