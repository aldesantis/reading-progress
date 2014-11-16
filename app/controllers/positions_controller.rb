class PositionsController < ApplicationController
  respond_to :json

  rescue_from Exception, with: :render_500
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def show
    @article = Article.find(params[:article_id])
    @position = @article.positions.find_by!(user_ip: request.remote_ip)

    respond_to do |format|
      format.json { render json: { status: :ok, position: { offset: @position.offset } } }
    end
  end

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

  def render_404
    respond_to do |format|
      format.json { render json: { status: :not_found }, status: 404 }
    end

    true
  end

  def render_500
    respond_to do |format|
      format.json { render json: { status: :error }, status: 500 }
    end

    true
  end
end
