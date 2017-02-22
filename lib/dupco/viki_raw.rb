class VikiRaw
  # Public: Parsing to get contents from Viki.com's home page
  #
  # Parameter
  #
  #   raw - Array of Html element after crawl by Spider
  #
  # Example
  #
  #   spider = Spider.new('https://www.viki.com')
  #   body = spider.crawl(class: '.abc')
  #   viki = Raw.new(body, VikiRaw.new)
  #   viki.process
  #   # => ["{'title': '', 'image_src': '', 'url': ''}, {..}"]
  #
  # Returns Array of hash contents
  def process(raw)
    raw.body.map {|element|
      {
        "title" => raw.title(element, '.thumb-title'),
        "image_src" => raw.image_src(element, '.thumbnail-img img'),
        "url" => raw.hyper_link(element, '.thumbnail-img')
      }.to_s
    }
  end
end

