class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_show, only: :edit

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @prototype.save
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
    
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = Comment.includes(:prototype)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
    
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy, :concept ).merge(user_id: current_user.id)
  end

  def move_to_show
    @prototype = Prototype.find(params[:id])
    if current_user.id != @prototype.user.id
      redirect_to action: :show
    end
  end
end
