class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to '/tasks'
  end

  def show
  end


private

  def task_params
    params.require(:task).permit(:person, :description)
  end

end
