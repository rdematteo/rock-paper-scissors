# frozen_string_literal: true

class ComputerPlayer < Player
  attr_reader :name

  def initialize
    super
    @name = 'Computer'
  end

  def player_move
    @move = Player::MOVES.sample
  end
end