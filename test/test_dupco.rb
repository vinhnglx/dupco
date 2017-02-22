require 'helper'

class DupcoTest < MiniTest::Test
  def setup
    url = "test/fixture.html"
    spider = Spider.new(url)
    body = spider.crawl(class: ".thumbnail.col-inline")
    viki = Raw.new(body, VikiRaw.new)
    @raw = viki.process
  end

  def test_show_duplicate_content
    dupco = Dupco.new(@raw)
    assert_equal true, dupco.duplicated?

    result = dupco.show
    assert_equal "Duplicate items: Wine Beauty", result
  end
end

