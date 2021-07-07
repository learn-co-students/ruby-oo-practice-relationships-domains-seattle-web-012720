class Listing
    attr_accessor :name, :city
    
    @@all = []
    def initialize(name, city)
        @name = name
        @city = city
        save
    end

    def trips
        Trip.all.select {|trip| trip.listing == self}
    end

    def guests
        trips.map {|trip| trip.guest.name}
    end

    def trip_count
        trips.length
    end

    def self.find_all_by_city(city)
        @@all.select {|listing| listing.city == city}
    end

    def self.most_popular
       #works if there are no ties
       #list = Trip.all.map {|trip| trip.listing.name}
       #list.max_by { |i| list.count(i) }

       list = Trip.all.map {|trip| trip.listing.name}
       hash = Hash.new(0)
       list.each{|key| hash[key] += 1}
       list_of_numbers = hash.map {|k,v| v}
       max_num = list_of_numbers.max
       final_hash = hash.select do |k,v|
          if v == max_num
             k
          end
       end
       final = final_hash.map{|k,v| k}
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end
end