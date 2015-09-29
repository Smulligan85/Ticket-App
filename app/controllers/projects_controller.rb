class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Prject is saved."
    else
      # add else
    end
  end

  def show
    @project = Project.find(params[:id])
  end
  
end

private

def project_params
  params.require(:project).permit(:name, :description)
end
