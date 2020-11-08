class TennisGame1
  def initialize(p1_name, p2_name)
    @p1_name = p1_name
    @p2_name = p2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    if player_name == 'player1'
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def score
    return score_draw if @p1_points == @p2_points
    return score_advantage_or_win if @p1_points >= 4 || @p2_points >= 4
    score_in_progress
  end

  private

  def score_advantage_or_win
    minus_result = @p1_points - @p2_points
    return 'Advantage player1' if minus_result == 1
    return 'Advantage player2' if minus_result == -1
    return 'Win for player1' if minus_result >= 2
    'Win for player2'
  end

  def score_draw
    {
      0 => 'Love-All',
      1 => 'Fifteen-All',
      2 => 'Thirty-All'
    }.fetch(@p1_points, 'Deuce')
  end

  def score_in_progress
    scores = %w[Love Fifteen Thirty Forty]
    "#{scores[@p1_points]}-#{scores[@p2_points]}"
  end
end