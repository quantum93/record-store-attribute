require ('pry')

class Album
  attr_reader :id
  attr_accessor :name, :artist, :genre, :year
  @@albums = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @artist = attributes.fetch(:artist)
    @genre = attributes.fetch(:genre)
    @year = attributes.fetch(:year)
    @id = attributes.fetch(:id) || @@total_rows +=1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = self
    Album.sort
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
    @@albums.values.select do |album|
    album.name == name
    end
  end

  def self.sort
    array = @@albums.sort_by {|key, val| val.name}
    @@albums = Hash[array.map { |key, val | [key,val]}]
  end


  def update(name,artist,genre,year)
    self.name = name
    self.artist = artist
    self.genre = genre
    self.year = year
    @@albums[self.id] = self
  end

  def delete
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end
end
