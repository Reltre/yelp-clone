class AddPhoneNumberAndHoursToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :phone_number, :string
    add_column :businesses, :time_open,    :time
    add_column :businesses, :time_close,   :time
  end
end
