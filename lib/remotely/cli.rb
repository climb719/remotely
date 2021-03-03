class CLI 
   
    def call
        puts ' '
        puts Rainbow("Welcome to Remotely!").bright.green
        puts Rainbow("Here are the job categories you can choose from:").aqua
        puts ' '
        menu
    end
 
    def menu
        input = nil
        API.get_categories
        Category.list_categories
        puts ' '
        puts Rainbow("Please enter the number for the category you want to search:").cyan
        
        while input != "q" 
            puts Rainbow("Type 'c' to return to job categories or 'q' to quit:").blueviolet
            input = gets.strip
        if input.to_i > 0 && input.to_i < 17
            index = input.to_i - 1
            cat_obj = Category.all[index] 
            puts Rainbow("Here are the jobs for #{cat_obj.name}:").magenta
            sleep(1)
            API.get_jobs(cat_obj)
            Job.list_jobs  
            puts Rainbow("Type 'n' the next 25 jobs for #{cat_obj.name}:").magenta 
        elsif input == "n"
            sleep(1)
            API.get_jobs(cat_obj)
            Job.list_next_jobs  
      # only want user to be able to press n once or make dynamic so will list more jobs? 
        elsif input == "c"
            Category.list_categories 
            puts ' '
            puts Rainbow("Please enter the number for the category you want to search:").cyan
        elsif input == "q"
            goodbye
        else
            puts Rainbow("Invalid entry, please enter your choice again!").blink.red
        end
       end
     end

     def goodbye
        puts Rainbow("Good luck with your next steps! Come back to search more remote jobs.").orange
    end

end