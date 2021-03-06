class MessagesController < ApplicationController
  before_filter :init_messages

  def index # see init_messages
    render "projects/index"
  end
  
  def show # see init_messages
    @message.update_attributes(:readers => @message.readers.push(current_user.id)) unless @message.readers.index(current_user.id)
  end

  def new # see init_messages
  end
  
  def new_answer # see init_messages
    render "new_answer"
  end

  def edit # see init_messages
  end

  def create
    params[:message][:user_id] = current_user.id
    @message = @project.messages.build(params[:message])
    if @message.save
      redirect_to @project, :notice => 'Message was successfully created.'
    else
      render "new"
    end
  end

  def update
    if @message.update_attributes(params[:message])
      redirect_to @project, notice: 'Message was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    if @project.messages.delete(@message)
      flash[:notice] = 'Message was successfully deleted.'
    else
      flash[:alert] = 'Message was NOT deleted.'
    end
    redirect_to @project
  end
  
  protected
  def init_messages
    @show_project_form, @show_projects = Project.get_visibility_options(params[:controller], params[:action])
    @project = Project.find(params[:project_id])
    @projects = @project.closed == 1 ? Project.closed : Project.active
    @message = params[:id] ? @project.messages.find(params[:id]) : Message.new
    @messages = @project.messages.is_topic
  end
end
