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
    quart_finale = Array.new(0)
    demi_finale = Array.new(0)
    finale = Array.new(0)
    if tournament[0][0].is_a? Array
    then
    tournament.map do |poule|
      poule.map do |tour|
        quart_finale.push(self.winner(tour[0], tour[1]))
      end
      quart_finale.map do |finale|
        demi_finale.push(finale)
      end
      finale.push(self.winner(demi_finale[0], demi_finale[1]))
    end
    else
      finale = tournament
    end
    self.winner(finale[0], finale[1])
  end

end
#puts RockPaperScissors.winner(['Armando','R'], ['Dave','S'])  # => ['Dave','S']

base = [["Armando", "P"], ["Dave", "S"]]
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
#print RockPaperScissors.tournament_winner(tourney)
print RockPaperScissors.tournament_winner(base)

