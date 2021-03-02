class Job

    attr_accessor :title, :company_name, :job_type, :description, :url
    @@all = [] # use array to access objects in other projects 
    #type and info
    def initialize(role, employer, type, info, link)
        @title = role
        @company_name = employer
        @job_type = type
        @url = link
        @description = info
        save
    end

    def save
        @@all << self 
    end

    # def description_text
    #     @@all.map { |job| job.description}
    # #  puts list.join("\n")
    # # hash["description"]
    #      info = Nokogiri::HTML(job.description)
    #        binding.pry
    #      puts info.xpath("//text()").to_s.split.join(' ')
    #     save
    # end


    def self.all # class reader to be able to see/access all job objects 
        @@all
    end

    def self.list_jobs
         @@all[1..15].map do |job| 
     
        puts Rainbow("Job title: #{job.title}").indianred
        puts Rainbow("Company: #{job.company_name}").orange
        puts Rainbow("Job-type: #{job.job_type}").yellow
        info = Nokogiri::HTML("#{job.description}")
        puts Rainbow("Description:" + ' ' + info.xpath("//text()").to_s.split[0..100].join(' ') + "...").green
        puts Rainbow(TTY::Link.link_to("For more info or to apply(clickable link)", "#{job.url}")).bright.blue
        end
    end

    
    def self.list_next_jobs
        @@all[16..30].map do |job| 
    
       puts Rainbow("Job title: #{job.title}").indianred
       puts Rainbow("Company: #{job.company_name}").orange
       puts Rainbow("Job-type: #{job.job_type}").yellow
       info = Nokogiri::HTML("#{job.description}")
       puts Rainbow("Description:" + ' ' + info.xpath("//text()").to_s.split[0..100].join(' ') + "...").green
       puts Rainbow(TTY::Link.link_to("For more info or to apply (clickable link)", "#{job.url}")).bright.blue
       end
   end


end
