class NovelsController < ApplicationController
  before_action :set_novel, only: [:update]
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
    byebug
    if @novel_create_form.save
      redirect_to novels_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @novel = Novel.find(params[:id])
    @review = Review.new
    @reviews = @novel.reviews.includes(:user).order(created_at: :desc)

    
  end

  def edit
    @novel = Novel.find(params[:id])
    unless @novel.user.id == current_user.id
      redirect_to novel_path(@novel)
    end
  end

  def update
    if @novel_create_form.update(novel_params)
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

  def set_novel
    @novel_create_form = current_user.novels.find(params[:id])
  end

  def novel_params
    params.require(:novel_create_form).permit(
                  :title, :genre, :story_length, :plot, :image, :release, :character_role, :character_text).merge(
                  user_id: current_user.id)
  end
end
