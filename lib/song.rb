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
    new_song = self.new
    self.all << new_song
    new_song
  end
  
  def self.new_by_name(song_name)
    new_song_with_name = self.new
    new_song_with_name.name = song_name
    new_song_with_name
  end
  
  def self.create_by_name(song_name)
    song = self.create     
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
     self.all.find { |song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_name)
    #remove .mp3
    song_name.gsub!(".mp3", "")
    #split on "-"
    song_array = song_name.split(" - ")
    #song.create_by_name = array[1]
    song = self.create_by_name(song_array[1])
    song.name= song_array[1]
    #set array[0] to song.artist_name
    song.artist_name = song_array[0]
    #return song_name
    song
  end
  
  def self.create_from_filename(song_name)
    #remove .mp3
    song_name.gsub!(".mp3", "")
    #split on "-"
    song_array = song_name.split(" - ")
    #song.create_by_name = array[1]
    song = self.create
    song.name= song_array[1]
    #set array[0] to song.artist_name
    song.artist_name = song_array[0]
    #return song_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
