class TasksController < ApplicationController
  def index
    @tasks = Task.all # no more fake DB
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
