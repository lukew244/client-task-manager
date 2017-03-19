class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :all_companies, only: [:new, :create, :edit, :update]

  def index
    @tasks = Task.where(company: current_user.company)
  end


  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.company ||= current_user.company
    if @task.save
      redirect_to '/tasks'
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Task updated successfully'
      redirect_to '/tasks'
    else
      render 'edit'
    end
  end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
  flash[:notice] = 'Task deleted successfully'
  redirect_to :back
end

private
  def all_companies
    @all_companies = (User.all.collect { |u| u.company }).uniq
  end

  def task_params
    params.require(:task).permit(:person, :description, :company, :status)
  end

end
