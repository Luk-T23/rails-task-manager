class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @creating = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to root_path
  end

  def update
    Task.find_by(:name)
   # Task.title = ???
   # Task.details = ???
    Task.save
    # updates/changes a task
  end

  def destroy
    Task.find_by(:name)
    Task.destroy
    # deletes a task
  end

  private

  def task_params
    params.require(:task).permit(:name, :details)
  end
end
