module ReviewsHelper
  def format_price_range(times)
    '$' * times
  end

  def shortened_content(string)
    string.truncate_words(10, separator: /[,! ?;:]/)
  end
end
