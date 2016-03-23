module ReviewHelper
  def format_price_range(times)
    '$' * times
  end

  def shortened_content(string)
    content = string.match(/.+[\?.!;]/)
    return string if content.nil?
    content = content[0,2].join
    content.chop << "..." if content.size > 16
    content
  end
end
