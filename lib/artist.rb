
class Artist
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # 1. Iterates through the Song class @@all to find the songs whos .artist equals self.
    def songs
        associated_songs = []
        Song.all.map do |song|
            if song.artist == self
            associated_songs << song
            end
        end
        associated_songs
    end

    # tell all passed in songs that it belongs to this Artist
    def add_song(song_name)
        Song.all.find do |song|
            if song_name == song
                song.artist = self
            end
        end
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    def print_songs
        songs.each {|song| puts song.name }
    end

end
            


