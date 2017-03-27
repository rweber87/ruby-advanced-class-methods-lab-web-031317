class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	new_song = Song.new
  	self.all << new_song
  	new_song
  end

  def self.new_by_name(name)
  	new_song = Song.new
  	new_song.name = name
  	new_song
  end

  def self.create_by_name(name)
  	new_song = Song.create
  	new_song.name = name
  	new_song
  end

  def self.find_by_name(name)
  	@@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if !self.find_by_name(name)
  		self.create_by_name(name)
  	else
  		self.find_by_name(name)
  	end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
 		self.all.clear 	
  end

  def self.alphabetical
  	self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
  	song_name = file_name.split(" - ")[1].split(".")[0]
  	artist_name = file_name.split(" - ")[0]
  	new_song = Song.new
  	new_song.name = song_name
  	new_song.artist_name = artist_name
  	new_song 
  end

  def self.create_from_filename(file_name)
  	song_name = file_name.split(" - ")[1].split(".")[0]
  	artist_name = file_name.split(" - ")[0]
  	new_song = Song.create
  	new_song.name = song_name
  	new_song.artist_name = artist_name
  	new_song
  end
end
