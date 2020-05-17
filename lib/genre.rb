class Genre

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save 
    end

    def save 
        @@all << self 
    end 

    def self.all 
        @@all 
    end

    def songs
        Song.all.filter do |song|
            song.genre == self
        end 
    end 

    def artists
        songs.collect do |song|
            song.artist 
        end 
    end 

    def new_song(name, artist)
        Song.new(name, artist, self)
      end

end