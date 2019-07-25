class Song
  attr_reader :id, :lyrics, :writer
  attr_accessor :name, :album_id

  @@songs = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @album_id = attributes.fetch(:album_id)
    @lyrics = attributes.fetch(:lyrics)
    @writer = attributes.fetch(:writer)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(song_to_compare)
    (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id())
  end

  def self.all
    @@songs.values
  end

  def save
    @@songs[self.id] = self
  end

  def self.find(id)
    @@songs[id]
  end

  def update(name, album_id)
    self.name = name
    self.album_id = album_id
    @@songs[self.id] = self
  end

  def delete
    @@songs.delete(self.id)
  end

  def self.clear
    @@songs = {}
  end


# Issues with this method returning empty array. Fails test.

  def self.find_by_album(alb_id)
    songs = []
    @@songs.values.each do |song|
      if song.album_id == alb_id
        songs.push(song)
      end
    end
    binding.pry
    songs
  end


# this is the issue, moving to album.rb per lessons.
  # def songs
  #   Song.find_by_album(self.id)
  # end

  def album
    Album.find(self.album_id)
  end

end
