class JobsController < ApplicationController

  def index
    if params[:city]
      @jobs = Job.city_select(params[:city])
      @city = @jobs.first.city
      render 'jobs/city_index'
    else
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    end
  end

  def show
    @companies = Company.all
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comments = @job.comments.order(created_at: :desc)
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
