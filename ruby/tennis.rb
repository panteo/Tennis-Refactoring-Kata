class TennisGame3
  def initialize(p1_name, p2_name)
    @p1_name = p1_name
    @p2_name = p2_name
    @p1_score = 0
    @p2_score = 0
  end

  def won_point(n)
    if n == @p1_name
      @p1_score += 1
    else
      @p2_score += 1
    end
  end

  def score
    if @p1_score < 4 && @p2_score < 4 && (@p1_score + @p2_score < 6)
      p = %w[Love Fifteen Thirty Forty]
      s = p[@p1_score]
      @p1_score == @p2_score ? s + '-All' : s + '-' + p[@p2_score]
    else
      if @p1_score == @p2_score
        'Deuce'
      else
        s = @p1_score > @p2_score ? @p1_name : @p2_name
        (@p1_score - @p2_score) * (@p1_score - @p2_score) == 1 ? 'Advantage ' + s : 'Win for ' + s
      end
    end
  end
end
