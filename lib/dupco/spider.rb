class Spider
  attr_reader :driver

  # Public: Create constructor
  #
  # Parameter
  #
  #   url - the link to web page
  #
  # Example
  #
  #   Spider.new("http://example.com")
  #
  # Returns nothing
  def initialize(url)
    @driver = Selenium::WebDriver.for(:phantomjs)
    @driver.navigate.to(url)
  end

  # Public: Finding elements from list of class
  #
  # Parameter
  #   options - The hash contain list of class
  #
  # Example
  #
  #   spider = Spider.new("http://example.com")
  #   spider.crawl(class: "container")
  #
  # Returns the array of Html elements that have same class with parameter
  def crawl(options = {})
    raise MissingClassValue unless options.has_key?(:class)

    klass = options[:class]

    _page_source.css(klass)
  end

  private

  # Private: parse HTML content from web page
  #
  # Returns the html contents were parsed.
  def _page_source
    Nokogiri::HTML(driver.page_source)
  end
end

