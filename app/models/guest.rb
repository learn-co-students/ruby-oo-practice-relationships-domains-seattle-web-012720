class Guest
    attr_accessor :name
    
    @@all = []
    def initialize(name)
        @name = name
        save
    end

    def book_trip(listing)
        Trip.new(listing, self)
    end

    def trips
        Trip.all.select {|trip| trip.guest == self}
    end

    def listings
        trips.map {|trip| trip.listing}
    end

    def trip_count
        trips.length
    end

    def self.pro_traveler
        list = Trip.all.map {|trip| trip.guest}
        puts "=" * 20
        pp list
        puts "=" * 20
        traveler_count = Hash.new(0)
        list.each {|guest| traveler_count[guest] += 1}
        final_count = []
        traveler_count.select do |k,v|
            if v > 1 
                final_count << k
            end
        end
    end

    def self.find_all_by_name(name)
        @@all.select {|guest| guest.name == name}
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end
end
