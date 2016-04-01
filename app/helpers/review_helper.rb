module ReviewHelper
  def format_price_range(times)
    '$' * times
  end

  def shortened_content(string)
    content = string.match(/.{,49}[ \?.!;]/)[0]
    return string if content.nil?
    content.chop! << "..." if content.size > 49
    content
  end
end
