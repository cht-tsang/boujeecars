class AddDetailsToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date, :string
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :end_date, :datetime
  end
end
