require 'digest/md5'

class Dupco
  attr_reader :raw

  # Public: Create constructor
  #
  # Parameter
  #
  #   raw - array of Hashes contains information to check duplicate
  #
  # Example
  #
  #   Dupco.new([{title: '', image_src: '', url: ''}])
  #
  # Returns nothing
  def initialize(raw)
    @raw = raw
  end

  # Public: Check duplicate content
  #
  # Example
  #
  #   dupco = Dupco.new([{title: '', image_src: '', url: ''}, {...}])
  #   dupco.duplicated?
  #   # => true
  #
  # Returns Boolean
  def duplicated?
    !(_duplicated_hash(raw).empty?)
  end

  # Public: Show the duplicate content's titles
  #
  # Example
  #
  #   dupco = Dupco.new([{title: '', image_src: '', url: ''}, {...}])
  #   dupco.show
  #   # => "Duplicate items: A, B"
  #
  # Returns a message about which items are duplicated
  def show
    res = []
    _duplicated_hash(raw).each_value do |value|
      res << value.first[:title]
    end
    "Duplicate items: #{res.join(', ')}"
  end


  private

  # Private: Encrypt element in raw by MD5
  #
  # Parameter
  #
  #   raw: Array of elements need to be encrypt
  #
  # Example
  #
  #   _duplicated_hash(['{title: "...", image_src: "...", url: "..."}', '{...}'])
  #   # => {:"68780492xxxxxx"=>[{:title=>"...", :image_src=>"...", :url=>"..."},{..}]}
  #
  # Returns a Hash includes duplicate elements
  def _duplicated_hash(raw)
    hash = {}
    raw.each do |el|
      key = Digest::MD5.hexdigest(el).to_sym
      # Convert hash string to hash
      _el = el.gsub(/[{}:"]/,'').split(', ').map{|h| h1,h2 = h.split('=>'); {h1.to_sym => h2}}.reduce(:merge)
      hash.has_key?(key) ? hash[key].push(_el) : hash[key] = [_el]
    end

    hash.delete_if { |key, value| value.size == 1 }
  end
end

