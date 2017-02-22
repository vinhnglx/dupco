class Raw
  attr_reader :body
  attr_accessor :client

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
  def initialize(body, client)
    @body = body
    @client = client
  end

  # Public: Strategy method
  #
  # Returns nothing
  def process
   client.process(self)
  end

  # Public: Get title of element
  #
  # Parameters
  #   element - Html element
  #   title_class - class name of element
  #
  # Example
  #   client.title(element, ".title")
  #   # => Wine beauty
  #
  # Returns title of element
  def title(element, title_class)
    element.css(title_class).text.strip unless element.css(title_class).empty?
  end

  # Public: Get src of image
  #
  # Parameters
  #   element - Html element
  #   image_class - class name of element
  #
  # Example
  #   client.image_src(element, ".image")
  #   # => "http://example.com/1/sample.jpg"
  #
  # Returns source of an image
  def image_src(element, image_class)
    require 'uri'
    URI(element.css(image_class).attribute('src').text).path unless element.css(image_class).empty?
  end

  # Public: Get url of a link
  #
  # Parameters
  #   element - Html element
  #   link_class - class name of element
  #
  # Example
  #   client.hyper_link(element, ".title")
  #   # => "http://example.com/1/"
  #
  # Returns source of link
  def hyper_link(element, link_class)
    element.css(link_class).attribute('href').text unless element.css(link_class).empty?
  end
end

