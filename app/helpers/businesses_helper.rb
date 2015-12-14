module BusinessesHelper
  def pretty_time_format(time)
    time.strftime("%I %M %p")
  end
end
