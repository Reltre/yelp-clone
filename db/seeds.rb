# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create(
  email: 'example@example.com', password: 'password',
  first_name: 'John', last_name: 'Smith'
)

sally = User.create(
  email: 'test@example.com', password: '12345678',
  first_name: 'Sally', last_name: 'Cage'
)

Business.create(
  user: john, price_range: 2, name: 'Pizza MMMM',
  address: '9570 Elderberry Ln., QuintenVille IL, 43279',
  description: 'Best Pizza in towwwwnnnnn.', phone_number: '212-561-9900',
  time_open: %w(09 00 AM), time_close: %w(06 00 PM),
  photo_url: 'http://blog.opentable.com/wp-content/uploads/2011/08/Slice.jpg'
)

Business.create(
  user: sally, price_range: 3, name: 'Chewy\'s Bar',
  address: '591 Casanova Blvd., La Cañada, CA 91021',
  description: 'Vintage Spirits', phone_number: '482-333-1422',
  time_open: %w(04 00 PM), time_close: %w(01 00 AM),
  photo_url: 'http://westfieldspiritshop.com/wp-content/uploads/tastrrrrrr.jpg'
)

Business.create(
  user_id: sally, price_range: 3, name: 'Judy\'s Fabrics',
  address: '22235 Orange St., Newark, PA 3576',
  description: 'Fabrics, Arts, Crafts, and More!', phone_number: '723-559-8121',
  time_open: %w(08 00 AM), time_close: %w(09 00 PM),
  photo_url: 'https://cbsphilly.files.wordpress.com/2012/05/shopping-style-fabric-stores-rolls-of-fabric.jpg'
)

Review.create(
  business_id: 1,
  user_id: 1,
  rating: 4,
  content: "Great pizza! We'll be coming back here again."
)

Review.create(
  business_id: 3,
  user_id: 2,
  rating: 5,
  content: "Finally, I found the right shade of blue to match my bathroom."
)
