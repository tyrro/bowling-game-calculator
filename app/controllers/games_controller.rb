class GamesController < ApplicationController
  def index
    @total_score = CalculateScore.call(params[:q])
  end
end
