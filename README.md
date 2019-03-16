# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

in the consolde do:

rails generate scaffold Agency name:string location:string
rails generate scaffold Recruiter name:string firstname:string agency:references
rails generate scaffold Job title:string field:string description
rails g migration CreateJobsRecruiters
rails db:migrate


in the db =>migrate=> create_jobs_recruiters.rb
change to:

class CreateJobsRecruiters < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs_recruiters, :id=>false do |t|
      t.integer "recruiter_id"
      t.integer "job_id"
    end
  end
end

then add the relationships in the models folder

at the end
$ rails g migration AddUserToProducts user:references
$ rake db:migrate
