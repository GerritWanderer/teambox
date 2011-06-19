class ProjectsController < ApplicationController
  before_filter :init_projects

  def index # see init_projects
  end

  def show # see init_projects
    render "index"
  end
  
  def new # see init_projects
    render "index"
  end

  def edit # see init_projects
    render "index"
  end

  def create # see init_projects
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_url, notice: 'Project was successfully deleted.'
    else
      redirect_to projects_url, alert: 'Project was NOT deleted.'
    end
  end
  
  protected
  def init_projects
    @show_project_form, @show_projects, @project_button = Project.get_visibility_options(params[:controller], params[:action])
    @projects = params[:closed].to_i == 1 ? Project.closed : Project.active
    @project = params[:id] ? Project.find(params[:id]) : Project.new
    @messages = @project.messages
  end
end
