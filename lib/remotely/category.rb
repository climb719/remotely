class Category

    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end

    def self.all=(arr)
        @@all=arr
    end

    def self.all
        @@all
    end

    def self.list_categories
       list =  @@all.map.with_index(1) { |job, index| puts "#{index}. #{job.name}" }
       list
    end

end