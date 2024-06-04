class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    Task.create(:name, :details)
    # creates a new task
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
end
