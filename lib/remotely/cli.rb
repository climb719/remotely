class CLI 
   
    def call
        puts Rainbow(" \nWelcome to Remotely!").bright.green
        puts Rainbow("Here are the job categories you can choose from:\n ").aqua
        menu
    end
    
    def menu
        input = nil
        display_categories
        while input != "q" 
            input = gets.strip
        if input.to_i > 0 && input.to_i < 17
            index = input.to_i - 1
            cat_obj = Category.all[index] 
            Job.all = []
            API.get_jobs(cat_obj)
            puts Rainbow("Getting the jobs for #{cat_obj.name}:\n ").magenta
            sleep(1) 
            last = 10 
            Job.list_jobs(1, last)  
            next_jobs(cat_obj)
            options
        elsif input == "n"
            sleep(1)
            new_start = last + 1
            last += 10 
            Job.list_jobs(new_start, last) 
            next_jobs(cat_obj)
            puts "All jobs for #{cat_obj.name} have been displayed. Type 'n' you'd like to return to the first 10 jobs." if last > Job.all.length
            last = 0 if last > Job.all.length
            options
        elsif input == "c"
            display_categories
        elsif input == "q"
            goodbye
        else
            puts Rainbow("Invalid entry, please enter your choice again.").blink.red
        end
       end
     end

     def display_categories
        API.get_categories
        Category.list_categories
        puts Rainbow(" \nPlease enter the number for the category you want to search or 'q' to quit:").cyan
     end

     def next_jobs(cat_obj)
        puts Rainbow("Type 'n' the next 10 jobs for #{cat_obj.name}:").magenta
     end

     def options
        puts Rainbow("Enter a new category number, type 'c' to return to job categories, or 'q' to quit:").blueviolet  
     end

     def goodbye
        puts Rainbow("Good luck with your next steps! Come back to search more remote jobs.\n ").orange
    end

end