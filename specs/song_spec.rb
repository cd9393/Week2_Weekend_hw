require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")

class SongTest < Minitest::Test

  def setup
    @song = Song.new("Twinkle Twinkle")
  end

  def test_get_name
    assert_equal("Twinkle Twinkle",@song.name)
  end
end
