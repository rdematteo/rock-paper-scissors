# frozen_string_literal: true

# Player class
# Game (App class)

class Player
  MOVES = %i[rock paper scissors].freeze

  attr_reader :score, :move

  def initialize
    @score = 0
    @move = nil
  end

  def get_move
    loop do
      puts 'Pick a move'
      print '> '
      @move = gets.chomp.strip.downcase.to_sym #convert string to symbol eg :rock
      return @move if MOVES.include?(@move)
      puts "Invalid move. Try Rock, Paper or Scissors"
    end
  end

  def win
    @score += 1
  end
end

class ComputerPlayer < Player

  def get_move
    @move = Player::MOVES.sample
  end

end

class Game
  WIN_SCENARIOS = [
    %i[rock scissors],
    %i[paper rock],
    %i[scissors paper]
  ].freeze

  def initialize
    @p1 = Player.new
    @p2 = ComputerPlayer.new
    # @p2 = Player.new
    
  
  end



  def pick_winner
    if @p1.move == @p2.move
      puts "It's a tie"
    elsif WIN_SCENARIOS.include?([@p1.move, @p2.move])
      puts 'P1 wins'
      @p1.win
    else
      puts 'p2 wins'
      @p2.win
      p @p2
    end
  end

  def play_round
    @p1.get_move
    @p2.get_move
    print_moves
    pick_winner
    print_scores
  end
  
  def print_moves
    puts "p1 played #{@p1.move}, p2 played #{@p2.move}"
  end

  def print_scores
    puts "Scores"
    puts "p1:#{@p1.score}"
    puts "p2:#{@p2.score}"
  end
end

game = Game.new
# game.pick_winner(%i[paper rock])
# p Player.new.get_move

game.play_round
