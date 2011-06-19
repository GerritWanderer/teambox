class AttachmentsController < ApplicationController
  before_filter :init_attachments
  
  def index # see init_attachments
    render "projects/index"
  end
  
  def show # see init_attachments
  end

  def new # see init_attachments
  end

  def edit # see init_attachments
  end
  
  def create
    @attachment = @project.attachments.build(params[:attachment])
    if @attachment.save
      redirect_to @project, :notice => 'Attachment was successfully created.'
    else
      render 'new'
    end
  end
  
  def update
    if @attachment.update_attributes(params[:attachment])
      redirect_to @project, :notice => 'Attachment was successfully updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    if @project.attachments.delete(@attachment)
      flash[:notice] = 'Attachment was successfully deleted.'
    else
      flash[:alert] = 'Attachment was NOT deleted.'
    end
    redirect_to @project
  end
  
  protected
  def init_attachments
    @show_project_form, @show_projects = Project.get_visibility_options(params[:controller], params[:action])
    @project = Project.find(params[:project_id])
    @projects = @project.closed == 1 ? Project.closed : Project.active
    @attachment = params[:id] ? @project.attachments.find(params[:id]) : Attachment.new
    @attachments = @project.attachments
  end
end
