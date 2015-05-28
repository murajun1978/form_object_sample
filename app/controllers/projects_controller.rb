class ProjectsController < ApplicationController
  before_action :set_project, only: :show
  before_action :set_project_form, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = ProjectForm.new
  end

  def edit
  end

  def create
    @project = ProjectForm.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def set_project_form
      @project = ProjectForm.find(params[:id])
    end

    def project_params
      params.require(:project_form).permit(:name, tags_attributes: [:id, :name])
    end
end
