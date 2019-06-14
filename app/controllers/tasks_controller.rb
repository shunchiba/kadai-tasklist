class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def show
  end
  
  def new
    @tasks = current_user.tasks.new
  end
  
  def create
    @tasks = current_user.tasks.new(task_params)
    
    if @tasks.save
      flash[:success] = "タスク が正常に保存されました"
      redirect_to root_url
    else
      flash.now[:danger] = "タスク が保存されませんでした"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスク は正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスク は更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスク は正常に削除されました"
    redirect_to root_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
