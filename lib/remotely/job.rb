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

    def self.all
        @@all
    end

    def self.list_jobs(a, b)
        @@all[a..b].map do |job| 
        puts Rainbow("Job title: #{job.title}").indianred
        puts Rainbow("Company: #{job.company_name}").orange
        puts Rainbow("Job-type: #{job.job_type}").yellow
        info = Nokogiri::HTML("#{job.description}")
        puts Rainbow(WordWrap.ww "Description:" + ' ' + info.xpath("//text()").to_s.split[0..100].join(' ') + "...", 100).chomp.green
        puts Rainbow(TTY::Link.link_to("Keep reading or apply", "#{job.url}")).bright.blue
        puts ' '
        end
    end


end
