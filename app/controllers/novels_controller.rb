class NovelsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @q = Novel.ransack(params[:q])
    @novels = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @novel_create_form = NovelCreateForm.new
  end

  def create
    @novel_create_form = NovelCreateForm.new(novel_params)
    if @novel_create_form.save
      redirect_to novels_path
    else
      render :new
    end
  end

  def show
    @novel = Novel.find(params[:id])
    @review = Review.new
    @reviews = @novel.reviews.includes(:user).order(created_at: :desc)

    if @novel.user.id == current_user.id
      render "novels/show"
    elsif (@novel.release != "draft") && current_user&.role == "writer"
      render "novels/show"
    elsif (@novel.release == "release" || @novel.release == "reader") && current_user&.role == "reader"
      render "novels/show"
    elsif @novel.release == "release"
      render "novels/show"
    else
      render novels_path
    end
  end

  def edit
    @novel = Novel.find(params[:id])
    unless @novel.user.id == current_user.id
      redirect_to novel_path(@novel)
    end
  end

  def update
    @novel = current_user.novels.find(params[:id])
    @novel_create_form = NovelCreateForm.new(novel_params, novel: @novel)
    if @novel_create_form.update
      redirect_to novel_path
    else
      render :new
    end
  end

  def destroy
    @novel = current_user.novels.find(params[:id])
    @novel.destroy!
    redirect_to novels_path
  end

  private

  def novel_params
    params.require(:novel).permit(
                  :title, :genre, :story_length, :plot, :image, :release, :character_role, :character_text).merge(
                  user_id: current_user.id)
  end
end
