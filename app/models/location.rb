class Location
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :location, :capacity
    def initialize(name, location, capacity)
        @name = name
        @location = location
        @capacity = capacity
        self.class.all << self
    end

    def trainers
        pairs = GymTrainer.all.select {|assoc| assoc.location == self}
        pairs.map {|pair| pair.trainer}
    end

    def clients_sans_trainers
        Client.all.select {|client| client.location == self}
    end

    def clients_associated
        self.trainers.map {|trainer| trainer.all_clients}.flatten
    end

    def total_clients
        clients_sans_trainers + clients_associated
    end

    def total_client_num
        total_clients.count
    end

    def self.most_clients
        self.all.max_by {|gym| gym.total_client_num}
    end

    def self.least_clients
        self.all.min_by {|gym| gym.total_client_num}
    end
end