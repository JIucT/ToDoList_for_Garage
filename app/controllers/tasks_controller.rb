class TasksController < ApplicationController
  before_filter :set_project, except: :change
  before_filter :set_task, only: [:edit, :update, :increase_priority, :decrease_priority]
  before_filter :authenticate_user!  


  def create
    @task = @project.tasks.build(task_params)
    flash[:alert] = @task.errors.full_messages unless @task.save
    redirect_to root_path
  end

  def edit
  end

  #changes task name
  def update 
    if @task.update(task_params)
      redirect_to projects_path
    else
      flash[:alert] = @task.errors.full_messages
      render action: 'edit'
    end
  end

  #change status: completed/not completed
  def change
    task = Task.find(params[:id])
    task.completed = params[:state]
    task.save
    render :json => { status: 200 }
  end

  def destroy
    @project.tasks.find(params[:id]).destroy
    render :json => { status: 200 }
  end

  def increase_priority
    @task.up
    redirect_to projects_path
  end

  def decrease_priority  
    @task.down
    redirect_to projects_path    
  end

private
  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:name)
  end

end
