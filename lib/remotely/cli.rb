class Remotely::CLI 
    # namespacing says cli belongs to the Remotely app and helps protect it from being written over
    def call
        puts Rainbow("Welcome to Remotely!").green
    end

end