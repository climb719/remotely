class Job

    attr_accessor :category, :title, :company_name, :description, :url

    def initialize(type, role, employer, info, link)
        @category = type
        @title = role
        @company_name = employer
        @description = info
        @url = link
    end


end
