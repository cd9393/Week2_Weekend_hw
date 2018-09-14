require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../songs")

class GuestTest < Minitest::Test
  def setup
    @fav_song = Song.new("Going to Ibiza")
    @guest = Guest.new("Craig",@fav_song, 100)
  end

  def test_wallet
    assert_equal(100,@guest.wallet)
  end

  def test_pay_money
    @guest.pay(20)
    assert_equal(80,@guest.wallet)
  end

  def test_cheer
    assert_equal("Wooo",@guest.cheer)
  end

  def test_sing
    assert_equal("I am singing Going to Ibiza", @guest.sing(@fav_song.name))
  end
end
