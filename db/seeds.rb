# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Business.create(price_range: 2, name: "Pizza MMMM", address: "9570 Elderberry Ln., QuintenVille IL, 43279",
                description: "Best Pizza in towwwwnnnnn.", phone_number: "212-561-9900",
                time_open: "9:00 AM", time_close: "6:00 PM"
               )
