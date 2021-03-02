class CLI 
   
    def call
        puts ' '
        puts Rainbow("Welcome to Remotely!").green
        puts Rainbow("Here are the job categories you can choose from:").cyan
        puts ' '
        menu 
    end

    def menu
        input = nil
        API.get_categories
        Category.list_categories
        puts Rainbow("Please enter the number for the categorty you want to search:").aqua
        while input != "q" 
            puts Rainbow("Type 'c' to return to job categories or 'q' to quit.").yellow
        
        input = gets.strip
        if input.to_i > 0 && input.to_i < 16
        index = input.to_i - 1
        
      
        cat_obj = Category.all[index] 
       
        puts Rainbow("Here are the jobs for #{cat_obj.name}:").green
        API.get_jobs(cat_obj)
       
        Job.list_jobs   
      binding.pry
        elsif input == "c"
           puts  Rainbow("Please enter the number for the categorty you want to search:").aqua
            Category.list_categories
        elsif input == "q"
            goodbye
        else
            puts Rainbow("Sorry, please enter your choice again!").red
        end
       end
     end

   
   
    def goodbye
        puts Rainbow("Good luck with your next steps! Come back to search more remote jobs.").orange
    end

end