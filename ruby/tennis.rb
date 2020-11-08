class TennisGame2
  SCORES = %w[Love Fifteen Thirty Forty].freeze

  def initialize(p1_name, p2_name)
    @p1_name = p1_name
    @p2_name = p2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    if player_name == @p1_name
      p1_score
    else
      p2_core
    end
  end

  def score
    p1res = SCORES[@p1_points] || ''
    p2res = SCORES[@p2_points] || ''

    return "#{p1res}-All" if @p1_points == @p2_points && @p1_points < 3
    return 'Deuce' if @p1_points == @p2_points && @p1_points > 2

    if @p1_points > 0 && @p2_points == 0
      p2res = 'Love'
    end
    if @p2_points > 0 && @p1_points == 0
      p1res = 'Love'
    end
    result = "#{p1res}-#{p2res}"

    if @p1_points > @p2_points && @p2_points >= 3
      result = "Advantage #{@p1_name}"
    end
    if @p2_points > @p1_points && @p1_points >= 3
      result = "Advantage #{@p2_name}"
    end

    if @p1_points >= 4 && @p2_points >= 0 && (@p1_points - @p2_points) >= 2
      result = "Win for #{@p1_name}"
    end
    if @p2_points >= 4 && @p1_points >= 0 && (@p2_points - @p1_points) >= 2
      result = "Win for #{@p2_name}"
    end

    result
  end

  private

  def p1_score
    @p1_points += 1
  end

  def p2_core
    @p2_points += 1
  end
end