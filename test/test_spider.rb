require 'helper'

class SpiderTest < MiniTest::Test
  def setup
    url = "test/fixture.html"
    @spider = Spider.new(url)
  end

  def test_init_spider
    assert_instance_of Spider, @spider
  end

  def test_crawl
    body = @spider.crawl(class: "a")
    assert_equal(1, body.count)

    body_1 = @spider.crawl(class: "thumbnail col-inline")
    assert_equal(2, body_1.count)
  end
end

