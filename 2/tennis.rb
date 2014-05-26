class TennisGame1

  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @player1_points = 0
    @player2_points = 0
  end



  def won_point(player_name)
    if player_name == @player1_name
      @player1_points += 1
    else
      @player2_points += 1
    end
  end



  SCORE_NAMES = {0 => "Love",
                 1 => "Fifteen",
                 2 => "Thirty",
                 3 => "Forty"}



  def score
    case
      when game_even?
        even_score_for @player1_points

      when game_advantage?
        "Advantage " + leading_player_name

      when game_won?
        "Win for " + leading_player_name

      else
        "#{SCORE_NAMES[@player1_points]}-#{SCORE_NAMES[@player2_points]}"
    end
  end



  private

  def game_even?
    @player1_points == @player2_points
  end



  def game_advantage?
    at_least_four_points_won_by_player? and point_difference == 1
  end



  def game_won?
    at_least_four_points_won_by_player? and point_difference >= 2
  end



  def at_least_four_points_won_by_player?
    @player1_points >= 4 or @player2_points >= 4
  end



  def point_difference
    (@player1_points - @player2_points).abs
  end



  def leading_player_name
    case
      when @player1_points > @player2_points
        @player1_name
      when @player2_points > @player1_points
        @player2_name
      else
        nil
    end
  end



  def even_score_for(player_points)
    case player_points
      when 0, 1, 2
        "#{SCORE_NAMES[player_points]}-All"
      else
        "Deuce"
    end
  end


end


class TennisGame2

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end



  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end



  def score
    result = ""
    if (@p1points == @p2points and @p1points < 3)
      if (@p1points==0)
        result = "Love"
      end
      if (@p1points==1)
        result = "Fifteen"
      end
      if (@p1points==2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1points==@p2points and @p1points>2)
      result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points==0)
      if (@p1points==1)
        p1res = "Fifteen"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p2points > 0 and @p1points==0)
      if (@p2points==1)
        p2res = "Fifteen"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points>@p2points and @p1points < 4)
      if (@p1points==2)
        p1res="Thirty"
      end
      if (@p1points==3)
        p1res="Forty"
      end
      if (@p2points==1)
        p2res="Fifteen"
      end
      if (@p2points==2)
        p2res="Thirty"
      end
      result = p1res + "-" + p2res
    end

    if (@p2points>@p1points and @p2points < 4)
      if (@p2points==2)
        p2res="Thirty"
      end
      if (@p2points==3)
        p2res="Forty"
      end
      if (@p1points==1)
        p1res="Fifteen"
      end
      if (@p1points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end

    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
      result = "Win for " + @player1Name
    end
    if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
      result = "Win for " + @player2Name
    end
    result
  end



  def setp1Score(number)
    (0..number).each do |i|
      p1Score()
    end
  end



  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end



  def p1Score
    @p1points +=1
  end



  def p2Score
    @p2points +=1
  end
end


class TennisGame3

  def initialize(player1Name, player2Name)
    @player1_name = player1Name
    @player2_name = player2Name
    @player1_score = 0
    @player2_score = 0
  end



  def won_point(n)
    if n == @player1_name
      @player1_score += 1
    else
      @player2_score += 1
    end
  end



  SCORE_NAMES = ["Love", "Fifteen", "Thirty", "Forty"]



  def score
    case
      when (@player1_score < 4 and @player2_score < 4 and @player1_score + @player2_score < 6)
        SCORE_NAMES[@player1_score] + "-" + (game_even? ? "All" : SCORE_NAMES[@player2_score])

      when game_even?
        "Deuce"

      when point_difference == 1
        "Advantage " + leading_player_name

      else
        "Win for " + leading_player_name
    end
  end



  private

  def game_even?
    @player1_score == @player2_score
  end



  def leading_player_name
    @player1_score > @player2_score ? @player1_name : @player2_name
  end



  def point_difference
    (@player1_score-@player2_score).abs
  end

end
