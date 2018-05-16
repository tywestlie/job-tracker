class JobsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comments = @job.sort_comments
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)
    job.save
    redirect_to job_path(job)
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to company_jobs_path(job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
