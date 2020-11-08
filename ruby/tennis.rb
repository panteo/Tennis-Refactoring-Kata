class TennisGame2
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
    result = ''
    if @p1_points == @p2_points && @p1_points < 3
      if @p1_points == 0
        result = 'Love'
      end
      if @p1_points == 1
        result = 'Fifteen'
      end
      if @p1_points == 2
        result = 'Thirty'
      end
      result += '-All'
    end
    if @p1_points == @p2_points && @p1_points > 2
      result = 'Deuce'
    end

    p1res = ''
    p2res = ''
    if @p1_points > 0 && @p2_points == 0
      if @p1_points == 1
        p1res = 'Fifteen'
      end
      if @p1_points == 2
        p1res = 'Thirty'
      end
      if @p1_points == 3
        p1res = 'Forty'
      end
      p2res = 'Love'
      result = p1res + '-' + p2res
    end
    if @p2_points > 0 && @p1_points == 0
      if @p2_points == 1
        p2res = 'Fifteen'
      end
      if @p2_points == 2
        p2res = 'Thirty'
      end
      if @p2_points == 3
        p2res = 'Forty'
      end

      p1res = 'Love'
      result = p1res + '-' + p2res
    end

    if @p1_points > @p2_points && @p1_points < 4
      if @p1_points == 2
        p1res = 'Thirty'
      end
      if @p1_points == 3
        p1res = 'Forty'
      end
      if @p2_points == 1
        p2res = 'Fifteen'
      end
      if @p2_points == 2
        p2res = 'Thirty'
      end
      result = p1res + '-' + p2res
    end
    if @p2_points > @p1_points && @p2_points < 4
      if @p2_points == 2
        p2res = 'Thirty'
      end
      if @p2_points == 3
        p2res = 'Forty'
      end
      if @p1_points == 1
        p1res = 'Fifteen'
      end
      if @p1_points == 2
        p1res = 'Thirty'
      end
      result = p1res + '-' + p2res
    end
    if @p1_points > @p2_points && @p2_points >= 3
      result = 'Advantage ' + @p1_name
    end
    if @p2_points > @p1_points && @p1_points >= 3
      result = 'Advantage ' + @p2_name
    end
    if @p1_points >= 4 && @p2_points >= 0 && (@p1_points-@p2_points) >= 2
      result = 'Win for ' + @p1_name
    end
    if @p2_points >= 4 && @p1_points >= 0 && (@p2_points-@p1_points) >= 2
      result = 'Win for ' + @p2_name
    end
    result
  end

  def setp1_score(number)
    (0..number).each do |i|
      p1_score
    end
  end

  def setp2_score(number)
    (0..number).each do |i|
      p2_core
    end
  end

  def p1_score
    @p1_points += 1
  end

  def p2_core
    @p2_points += 1
  end
end