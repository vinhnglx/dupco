require 'helper'

class SpiderTest < MiniTest::Test
  def test_init_spider
    url = "test/fixture.html"
    spider = Spider.new(url)

    assert_instance_of Spider, spider
  end

  def test_crawl
    url = "test/fixture.html"
    spider = Spider.new(url)
    body = spider.crawl(class: "thumbnail col-inline")

    assert_instance_of Nokogiri::XML::NodeSet, body
    assert_equal(2, body.count)
  end

end

