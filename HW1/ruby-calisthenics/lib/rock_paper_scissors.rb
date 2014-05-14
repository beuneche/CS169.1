class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    if !!(player1[1] =~ /[RSP]/) and !!(player2[1] =~ /[RSP]/)
    then
      player1[1] == "R" and player2[1] == "P" ? (return player2) : (return player1)
      player1[1] == "S" and player2[1] == "R" ? (return player2) : (return player1)
      player1[1] == "P" and player2[1] == "S" ? (return player2) : (return player1)
    else
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
  end

  def self.tournament_winner(tournament)
    tournament
    # YOUR CODE HERE
  end

end
#puts RockPaperScissors.winner(['Armando','R'], ['Dave','S'])  # => ['Dave','S']

tourney = [
        [
          [ ["Armando", "P"], ["Dave", "S"] ],
          [ ["Richard", "R"], ["Michael", "S"] ]
        ],
        [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
      ]
puts RockPaperScissors.tournament_winner(tourney)

