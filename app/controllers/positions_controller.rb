class PositionsController < ApplicationController
  respond_to :json

  def update
    @article = Article.find(params[:article_id])

    Position.first_or_create(
      user_ip: request.remote_ip,
      article: @article
    ).update_attributes!(position_params)

    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end

  protected

  def position_params
    params.require(:position).permit(:offset)
  end
end
