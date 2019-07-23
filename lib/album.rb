require ('pry')

class Album
  attr_reader :id
  attr_accessor :name, :artist, :genre, :year
  @@albums = {}
  @@total_rows = 0

  def initialize(name, artist, genre, year, id)
    @name = name
    @artist = artist
    @genre = genre
    @year = year
    @id = id || @@total_rows +=1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.artist, self.genre, self.year, self.id)
  end

  def == (album_to_compare)
    self.name() == album_to_compare.name()
    self.artist() == album_to_compare.artist()
    self.genre() == album_to_compare.genre()
    self.year() == album_to_compare.year()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search(name)
    self.name = name
  end

  def update(name,artist,genre,year)
    self.name = name
    self.artist = artist
    self.genre = genre
    self.year = year
    @@albums[self.id] = Album.new(self.name,self.artist, self.genre, self.year, self.id)
  end

  def delete
    @@albums.delete(self.id)
  end
end
