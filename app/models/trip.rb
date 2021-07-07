class Trip 
    attr_accessor :guest, :listing
    
    @@all = []
    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        save
    end

    def save
        @@all << self
    end

    def self.all 
        @@all
    end
end