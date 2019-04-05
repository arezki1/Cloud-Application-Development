
require 'observer'
class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json

  include Observable
  def index
    @jobs = Job.all
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'httparty'
    require 'openssl'

    page = Nokogiri::HTML(open("https://www.morganmckinley.ie/"))
    puts page.class   # => Nokogiri::HTML::Document
    @title=page.css(".blog-title").text
    @main=page.css('a[href="https://www.morganmckinley.ie/salary-survey"]')[0].text
    @paragraph=page.css(".article-teaser-text").css('.leading-para')[2].text
    @href=page.css(".read-more-link")[2]['href']


    /here we are handling the for search functionality/

    @search = params["search"]
    if @search.present?
      @title = @search["title"]
      @jobs = Job.where("title LIKE ?" , "%#{@title}%")

    else
      Job.all
    end

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
   @job = current_user.jobs.build(job_params)
   @job.user = current_user

   /user observer here to send job creation information/
   notify_observers(puts current_user.username," Has created a new job!!!")
   if @job.save
     redirect_to @job, notice: 'Job was successfully created.'
   else
     render :new
   end
 end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :field, :user_id)
    end
end
