class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
  redirect_to '/tasks'
end

private

  def task_params
    params.require(:task).permit(:person, :description)
  end

end
