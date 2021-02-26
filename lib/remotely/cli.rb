class CLI 
    # namespacing says cli belongs to the Remotely app and helps protect it from being written over
    def call
        puts Rainbow("Welcome to Remotely!").green
        puts Rainbow("Here are the job categories you can choose from:").cyan
        list_categories
        menu
    end

    def list_categories
        API.get_categories("https://remotive.io/api/remote-jobs/categories")
    end

    def menu
        input = nil
        puts Rainbow("Please enter the number for the categorty you want to search:").aqua
        input = gets.strip
       if input.to_i > 0 && input.to_i < 16
        index = input.to_i - 1
             API.get_jobs("https://remotive.io/api/remote-jobs?category=software-dev")
             puts 
        end
    end 

end