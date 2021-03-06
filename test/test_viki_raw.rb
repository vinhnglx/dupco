require 'helper'

class VikiRawTest < MiniTest::Test
  def setup
    url = "test/fixture.html"
    @spider = Spider.new(url)
  end

  def test_process
    body = @spider.crawl(class: ".thumbnail.col-inline")
    viki = Raw.new(body, VikiRaw.new)
    raw = viki.process

    assert_equal 3, raw.count
    assert_instance_of Array, raw
  end
end

