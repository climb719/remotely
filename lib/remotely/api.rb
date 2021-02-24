require 'httparty'
require 'pry'
require_relative './job'

class API

    def self.get_categories(url)
        #get data from API (outside resource)
        response = HTTParty.get(url)
     
       

        # create object from data 
        response["jobs"].each do |hash| #iterate and access each element in hash
            
            binding.pry
        end

    end

    # def get_jobs(category)

    # end

end

API.get_categories("https://remotive.io/api/remote-jobs/categories")