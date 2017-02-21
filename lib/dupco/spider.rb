require 'nokogiri'
require 'selenium-webdriver'
require 'phantomjs'

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

    klass = format_class(options[:class])

    page_source.css(klass)
  end

  private

  # Private: parse HTML content from web page
  #
  # Returns the html contents were parsed.
  def page_source
    Nokogiri::HTML(driver.page_source)
  end

  # Private: format string to class format
  #
  # Parameter
  #   class - The string of classes
  #
  # Example
  #   format_class("container content")
  #   # => ".container.content"
  #
  # Returns formated classes.
  def format_class(klass)
    "." + klass.squeeze(' ').strip.gsub(/\s/,'.')
  end
end

