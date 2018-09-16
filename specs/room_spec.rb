require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../songs")
require_relative("../room")

class RoomTest < Minitest::Test

  def setup
    @song1 = Song.new("Livin on a prayer")
    @song2 = Song.new("Brown eyed girl")
    @song3 = Song.new("Highway to hell")
    @song4 = Song.new("079")
    @songs = [@song1, @song2, @song3]
    @guest1 = Guest.new("Craig", @song3, 100)
    @guest2 = Guest.new("John", @song1, 50)
    @guest3 = Guest.new("Lewis", @song1, 200)
    @guest4 = Guest.new("Robert", @song4, 300)
    @room = Room.new("Classics",@songs, 50, 3)
  end

  def test_add_guest
    @room.add_guest(@guest1)
    assert_equal(1, @room.guests.length)
  end

  def test_add_guest_full
    @room.add_guest(@guest2)
    @room.add_guest(@guest3)
    @room.add_guest(@guest4)
    assert_equal("Not tonight",@room.add_guest(@guest1) )
  end

  def test_remove_guest
    @room.add_guest(@guest1)
    @room.remove_guest(@guest1)
    assert_equal(0, @room.guests.length)
  end

  def test_add_song
    @room.add_song(@song4)
    assert_equal(4,@room.songs.length)
  end

  def test_take_entrance_fee
    @room.take_entrance_fee(@room.entry_fee, @guest1)
    assert_equal(50, @guest1.wallet)
    assert_equal(50, @room.till)
  end

  # def test_fav_song_in_room
  #   assert_equal("Wooo", @guest.fav_song_in_room)
  # end

  def test_check_in_guest
    @room.check_in(@guest3,@room.entry_fee)
    assert_equal(1, @room.guests.length)
    assert_equal(150, @guest3.wallet)
    assert_equal(50, @room.till)
    assert_equal("Wooo", @room.check_in(@guest3,@room.entry_fee))
  end
end
