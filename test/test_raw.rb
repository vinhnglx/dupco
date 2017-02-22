require 'helper'

class RawTest < MiniTest::Test
  def setup
    url = "test/fixture.html"
    @spider = Spider.new(url)
  end

  def test_process
    body = @spider.crawl(class: ".thumbnail.col-inline")
    raw = Raw.new(body)

    data = [
      {
        title: "Blood",
        image_src: "https://1.viki.io/c/24437c/Blood_780x436.jpg?x=b&s=380x214&e=t&f=t&cb=1",
        url: "/tv/24437c-blood"
      },
      {
        title: "Wine Beauty",
        image_src: "https://1.viki.io/c/34202c/wine-beauty-780x436.jpg?x=b&s=380x214&q=h&e=t&f=t&cb=1",
        url: "/tv/34202c-wine-beauty"
      },
      {
        title: "Wine Beauty",
        image_src: "https://1.viki.io/c/34202c/wine-beauty-780x436.jpg?x=b&s=380x214&q=h&e=t&f=t&cb=1",
        url: "/tv/34202c-wine-beauty"
      }
    ]

    assert_equal data, raw.process
  end
end

