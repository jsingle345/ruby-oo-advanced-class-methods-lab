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
   @@all << song
   song
 end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    found_song = self.all.find do |song|
      song.name == title
    end
    found_song
  end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)

    if result
      result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
    song.name
    end
  end

  def self.new_from_filename(filename)
    playlist = filename.split(" - ")
    playlist[1] = playlist[1].chomp(".mp3")
    song = self.new
    song.artist_name = playlist[0]
    song.name = playlist[1]
    song
  end

  def self.create_from_filename(filename)
    playlist = filename.split(" - ")
    playlist[1] = playlist[1].chomp(".mp3")
    song = self.new
    song.artist_name = playlist[0]
    song.name = playlist[1]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

  

end
