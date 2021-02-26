require 'httparty'
require 'pry'
require_relative './job'
require_relative './category'
require 'nokogiri'

class API

    def self.get_categories(url)
        #get data from API (outside resource)
        response = HTTParty.get(url)
        response["jobs"].each do |hash|
      
        # list = response["jobs"].map.with_index do |x, i| 
        # puts "#{i + 1}. #{x["name"]}"
        Category.new(hash["name"])
        
        puts 
        end
    end

    #  list = response["jobs"].map { |x| x["name"] }
    #  puts list.join("\n")
    #     binding.pry
        
    def self.get_jobs(url)
        job_response = HTTParty.get(url)
        job_response["jobs"].each do |hash| #iterate to access each element in the hash
           
      # create object from data 
      Job.new(
          hash["title"],
          hash["company_name"],
          hash["job_type"],
          hash["url"]
      )
       # hash["description"] = Nokogiri::HTML(hash["description"])
       #puts info.xpath("//text()").to_s.split.join(' ')   #OR gsub("\n", ' ').squeeze(' ')  #gsub(/\s+/, " ")
       #puts info.css('span.cm-string').text.strip
       end
       binding.pry
    end

end

 API.get_categories("https://remotive.io/api/remote-jobs/categories")
 API.get_jobs("https://remotive.io/api/remote-jobs?category=software-dev")