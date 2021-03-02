# require 'httparty'
# require 'pry'
# require_relative './job'
# require_relative './category'

# require 'nokogiri'

class API

    def self.get_categories
        #get data from API (outside resource)
        response = HTTParty.get("https://remotive.io/api/remote-jobs/categories")
        response["jobs"].each do |hash|
      
        # list = response["jobs"].map.with_index do |x, i| 
        # puts "#{i + 1}. #{x["name"]}"
        Category.new(hash["name"])
        end
    end

    #  list = response["jobs"].map { |x| x["name"] }
    #  puts list.join("\n")
    #     binding.pry
        
    def self.get_jobs(cat_obj)
        job_response = HTTParty.get("https://remotive.io/api/remote-jobs?category=#{cat_obj.name}")
        job_response["jobs"].each do |hash| #iterate to access each element in the hash
          
      # create object from data 
      Job.new(
          hash["title"],
          hash["company_name"],
          hash["job_type"],
          hash["description"],
          hash["url"]
        ) 
        #  hash["description"]
        # info = Nokogiri::HTML(hash["description"])
        # puts info.xpath("//text()").to_s.split.join(' ')
        end
       # binding.pry
    end 

    # def self.get_description(url)
    #     description_response = HTTParty.get("https://remotive.io/api/remote-jobs?category=software-dev")
    #     description_response["jobs"].each do |hash|
    #         Description.new(hash["description"])

    #     info = Nokogiri::HTML(hash["description"])
    #    puts info.xpath("//text()").to_s.split.join(' ')   #OR gsub("\n", ' ').squeeze(' ')  #gsub(/\s+/, " ")

end


   #API.get_categories("https://remotive.io/api/remote-jobs/categories")
   #API.get_jobs("https://remotive.io/api/remote-jobs?category=#{cat_obj.name}")
  #API.get_description("https://remotive.io/api/remote-jobs?category=software-dev")