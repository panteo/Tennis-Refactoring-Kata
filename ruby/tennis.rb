class TennisGame3
  def initialize(p1_name, p2_name)
    @p1_name = p1_name
    @p2_name = p2_name
    @p1_score = 0
    @p2_score = 0
  end

  def won_point(player_name)
    if player_name == @p1_name
      @p1_score += 1
    else
      @p2_score += 1
    end
  end

  def score
    if @p1_score < 4 && @p2_score < 4 && (@p1_score + @p2_score < 6)
      scores = %w[Love Fifteen Thirty Forty]
      p1_text = scores[@p1_score]
      p2_text = scores[@p2_score]
      @p1_score == @p2_score ? "#{p1_text}-All" : "#{p1_text}-#{p2_text}"
    else
      return 'Deuce' if @p1_score == @p2_score
      player = @p1_score > @p2_score ? @p1_name : @p2_name
      (@p1_score - @p2_score) * (@p1_score - @p2_score) == 1 ? "Advantage #{player}" : "Win for #{player}"
    end
  end
end
