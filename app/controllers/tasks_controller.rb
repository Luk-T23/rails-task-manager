class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to root_path
  end

  def destroy
    @task.destroy ? flash[:success] = 'Task deleted succesfully' : flash[:error] = 'Deletion failed'
    redirect_back(fallback_location: root_path)
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :details)
  end
end
