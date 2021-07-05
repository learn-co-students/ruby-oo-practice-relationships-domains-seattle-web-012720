class Trainer
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :salary
    def initialize(name, salary)
        @name = name
        @salary = salary
        self.class.all << self
    end

    def join_location(location)
        GymTrainer.new(self, location)
    end

    def leave_location(location)
        GymTrainer.all.delete_if do |assoc|
            assoc.trainer == self && assoc.location == location
        end
    end

    def all_locations
        GymTrainer.all.select {|assoc| assoct.trainer == self}
    end

    def all_clients
        Client.all.select {|client| client.trainer == self}
    end

    def num_clients
        all_clients.count
    end

    def self.most_clients
        max = self.all.max_by {|trainer| trainer.num_clients}
        max.salary += 500
        puts "#{max.name} now makes #{max.salary}!"
    end
end