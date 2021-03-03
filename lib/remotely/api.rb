class API

    def self.get_categories
        response = HTTParty.get("https://remotive.io/api/remote-jobs/categories")
        response["jobs"].each do |hash|
        Category.new(hash["name"])
        end
    end

    def self.get_jobs(cat_obj)
        job_response = HTTParty.get("https://remotive.io/api/remote-jobs?category=#{cat_obj.name}")
        job_response["jobs"].each do |hash| 
          
        Job.new(
          hash["title"],
          hash["company_name"],
          hash["job_type"],
          hash["description"],
          hash["url"]) 
        end
    end 

end

   #API.get_categories("https://remotive.io/api/remote-jobs/categories")
   #API.get_jobs("https://remotive.io/api/remote-jobs?category=#{cat_obj.name}")
