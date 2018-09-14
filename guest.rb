class Guest
  attr_reader :wallet
  def initialize(name, fav_song, wallet)
    @name = name
    @fav_song = fav_song
    @wallet = wallet
  end

  def pay(value)
    @wallet -= value
  end

  def cheer
    return "Wooo"
  end

  def sing(song)
    return "I am singing #{song}"
  end
end
