require 'helper'

class SpiderTest < MiniTest::Test
  def test_init_spider
    spider = Spider.new

    assert_instance_of Spider, spider
  end

end

