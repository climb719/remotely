class Job

    attr_accessor :title, :company_name, :job_type, :description, :url
    @@all = []

    def initialize(role, employer, type, info, link)
        @title = role
        @company_name = employer
        @job_type = type
        @url = link
        @description = info
        @@all << self 
    end

    def self.list_jobs
        @@all[1..25].map do |job| 
        puts Rainbow("Job title: #{job.title}").indianred
        puts Rainbow("Company: #{job.company_name}").orange
        puts Rainbow("Job-type: #{job.job_type}").yellow
        info = Nokogiri::HTML("#{job.description}")
        puts Rainbow("Description:" + ' ' + info.xpath("//text()").to_s.split[0..100].join(' ') + "...").green
        puts Rainbow(TTY::Link.link_to("To keep reading or to apply(clickable link)", "#{job.url}")).bright.blue
        end
    end

    def self.list_next_jobs
        @@all[26..50].map do |job| 
        puts Rainbow("Job title: #{job.title}").indianred
        puts Rainbow("Company: #{job.company_name}").orange
        puts Rainbow("Job-type: #{job.job_type}").yellow
        info = Nokogiri::HTML("#{job.description}")
        puts Rainbow("Description:" + ' ' + info.xpath("//text()").to_s.split[0..100].join(' ') + "...").green
        puts Rainbow(TTY::Link.link_to("For more info or to apply (clickable link)", "#{job.url}")).bright.blue
        end
    end 

end
