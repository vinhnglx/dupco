class VikiRaw
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

