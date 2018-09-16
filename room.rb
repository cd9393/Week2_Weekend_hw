class Room
  attr_reader :guests, :songs, :entry_fee, :till

  def initialize(name, songs, entry_fee,size)
    @name = name
    @songs = songs
    @entry_fee = entry_fee
    @guests = []
    @size = size
    @till = 0
  end

  def add_guest(guest)
    if @guests.length < @size
    @guests.push(guest)
    else
      return "Not tonight"
    end
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def take_entrance_fee(fee, guest)
    guest.pay(fee)
    @till += fee

  end
end
