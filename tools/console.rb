require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

kim = Guest.new("Kim")
johnny = Guest.new("Jonny")
jazz = Guest.new("Jazz")
elaine = Guest.new("Elaine")
adam = Guest.new("Adam")

cancun = Listing.new("House in Cancun", "Mexico")
nyhavn = Listing.new("Nyhavn", "Denmark")
mariana_trench = Listing.new("Deepest Part of the Ocean", "The Pacific Ocean")
ashland = Listing.new("Close to Shakespeare", "Orgeon")
skagen = Listing.new("Skagen", "Denmark")

kim.book_trip(mariana_trench)
kim.book_trip(nyhavn)
johnny.book_trip(cancun)
elaine.book_trip(nyhavn)
adam.book_trip(ashland)

Pry.start
0
