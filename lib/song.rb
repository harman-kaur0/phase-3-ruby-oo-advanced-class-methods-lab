require "pry"
class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    file = filename.gsub(" - ", "*").split("*")
    # binding.pry
    artist = file[0]
   file[1].slice! ".mp3"
    song = self.new
    song.name = file[1]
    song.artist_name = artist
    song   
  end

  def self.create_from_filename(filename)
    file = filename.gsub(" - ", "*").split("*")
    # binding.pry
    artist = file[0]
   file[1].slice! ".mp3"
    song = self.new
    song.name = file[1]
    song.artist_name = artist
    song.save
  end

  def self.destroy_all
    @@all =[]
  end
end
