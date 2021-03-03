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
        puts Rainbow("Please enter the number for the category you want to search or 'q' to quit:").cyan
        
        while input != "q" 
        
            input = gets.strip
          
        if input.to_i > 0 && input.to_i < 17
            index = input.to_i - 1
            cat_obj = Category.all[index] 
            puts Rainbow("Getting the jobs for #{cat_obj.name}:").magenta
            puts ' '
            sleep(1)
            last = 10  
            API.get_jobs(cat_obj)
            Job.list_jobs(1, last)  
            puts Rainbow("Type 'n' the next 10 jobs for #{cat_obj.name}:").magenta
            puts Rainbow("Enter a new category number, type 'c' to return to job categories, or 'q' to quit:").blueviolet
        elsif input == "n"
            sleep(1)
            new_start = last + 1
            last += 10 
            Job.list_jobs(new_start, last) 
            puts Rainbow("Type 'n' the next 10 jobs for #{cat_obj.name}:").magenta 
            puts "All jobs for #{cat_obj.name} have been displayed. Type 'n' you'd like to return to the first 10 jobs." if last > Job.all.length
            last = 0 if last > Job.all.length
            puts Rainbow("Enter a new category number, type 'c' to return to job categories, or 'q' to quit:").blueviolet
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