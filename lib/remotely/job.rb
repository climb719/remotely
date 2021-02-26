class Job

    attr_accessor :title, :company_name, :job_type, :url
    @@all = [] # use array to access objects in other projects 
    #type and info
    def initialize(role, employer, type, link)
        @title = role
        @company_name = employer
        @job_type = type
        @url = link
        #@description = info
        @@all << self 
    end

    def self.all # class reader to be able to see/access all job objects 
        @@all
    end


end
