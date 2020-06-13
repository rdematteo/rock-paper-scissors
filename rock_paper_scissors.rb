# frozen_string_literal: true

# Player class
# Game (App class)

class Player
  MOVES = %i[rock paper scissors].freeze

  attr_reader :score, :move, :name
  attr_writer :name


  def initialize
    @score = 0
    @move = nil
    @name = 'Player 1'
  end

  def get_move
    loop do
      puts 'Pick a move'
      print '> '
      @move = gets.chomp.strip.downcase.to_sym # convert string to symbol eg :rock
      if @move == :quit
        return false
      elsif MOVES.include?(@move)
        return @move
      else
        puts 'Invalid move. Try Rock, Paper or Scissors'
      end
    end
  end

  def win
    @score += 1
  end
end

class ComputerPlayer < Player

  def initialize
    super
    @name = 'Computer'
    
  end

  def name
    @name
  end

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
    puts " What is your name"
    @p1.name = gets.chomp.strip
    puts "Welcome #{@p1.name}"
    @p2 = ComputerPlayer.new
    # @p2 = Player.new
    play
  end

  def pick_winner
    if @p1.move == @p2.move
      puts "It's a tie"
    elsif WIN_SCENARIOS.include?([@p1.move, @p2.move])
      puts "#{@p1.name} wins"
      @p1.win
    else
      puts "#{@p2.name} wins"
      @p2.win
    end
  end

  def play_round
    return false unless @p1.get_move
    return false unless @p2.get_move
    print_moves
    pick_winner
    print_scores
    puts
    puts "Lets play again? Type 'quit' to end"
    true
  end

  def play
    loop do
      break unless play_round
    end
    puts 'Thanks for playing'
    print_scores
  end

  def print_moves
    puts "#{@p1.name} played #{@p1.move}, #{@p2.name} played #{@p2.move}"
  end

  def print_scores
    puts
    puts 'Scores'
    puts
    puts "#{@p1.name}: #{@p1.score}"
    puts "#{@p2.name}: #{@p2.score}"
  end
end

Game.new
