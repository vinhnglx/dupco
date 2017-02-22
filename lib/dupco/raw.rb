class Raw
  attr_reader :body

  # Public: Create constructor
  #
  # Parameter
  #
  #   body - array of Html elements
  #
  # Example
  #
  #   Raw.new([#<Nokogiri::XML::Element:0x3fe1b19d4dec name="div" ... ])
  #
  # Returns nothing
  def initialize(body)
    @body = body
  end

  # Public: Process array of Html elements
  #
  # Example
  #
  #   body = [#<Nokogiri::XML::Element:0x3fe1b19d4dec name="div" ... ]
  #   raw = Raw.new(body)
  #   raw.process
  #   # => [{title: "a", image_src: "http://exampl.org/1/thumbnail.jpg", url: "http://example.com/1"}]
  #
  # Returns array of hashes
  def process
    body.map {|element|
      {
        title: _title(element, '.thumb-title'),
        image_src: _image_src(element, '.thumbnail-img img'),
        url: _hyper_link(element, '.thumbnail-img')
      }
    }
  end

  private

  # Private: Get title of element
  #
  # Parameters
  #   element - Html element
  #   title_class - class name of element
  #
  # Example
  #   _title(element, ".title")
  #   # => Wine beauty
  #
  # Returns title of element
  def _title(element, title_class)
    element.css(title_class).text.strip
  end

  # Private: Get src of image
  #
  # Parameters
  #   element - Html element
  #   image_class - class name of element
  #
  # Example
  #   _image_src(element, ".image")
  #   # => "http://example.com/1/sample.jpg"
  #
  # Returns source of an image
  def _image_src(element, image_class)
    element.css(image_class).attribute('src').text
  end

  # Private: Get url of a link
  #
  # Parameters
  #   element - Html element
  #   link_class - class name of element
  #
  # Example
  #   _hyper_link(element, ".title")
  #   # => "http://example.com/1/"
  #
  # Returns source of link
  def _hyper_link(element, link_class)
    element.css(link_class).attribute('href').text
  end
end

