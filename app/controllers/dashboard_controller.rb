class DashboardController < ApplicationController
  def index
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'httparty'
    require 'openssl'

    page = Nokogiri::HTML(open("https://www.jobs.ie/Jobs.aspx?hd_searchbutton=true&Categories=4&Regions=63&Keywords=full+stack+developer+10+years+experince&job-search=true"))
    puts page.class   # => Nokogiri::HTML::Document
    table=number=page.css(".job-list")
    job=table.css(".job")
    @name1=table.css(".company")[1].text
    @name2=table.css(".company")[2].text
    @name3=table.css(".company")[3].text
    @job0=job.css("h2")[0].text
    @job1=job.css("h2")[1].text
    @job2=job.css("h2")[2].text
    @location1=table.css(".location")[1].text
    @location2=table.css(".location")[2].text
    @location3=table.css(".location")[3].text

  end
end
