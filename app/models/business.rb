class Business < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates_presence_of :name, :description, :time_open, :time_close

  def normalize_time
    self.time_open = "#{time_open[0]}:#{time_open[1]} #{time_open[2]}"
    self.time_close = "#{time_close[0]}:#{time_close[1]} #{time_close[2]}"
  end
end
