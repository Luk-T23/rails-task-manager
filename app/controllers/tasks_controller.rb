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
    @identity = Task.find(params[:id])
    @identity.destroy ? flash[:success] = 'Task deleted succesfully' : flash[:error] = 'Deletion failed'
    redirect_back(fallback_location: root_path)
  end

  private

  def task_params
    params.require(:task).permit(:name, :details)
  end
end
