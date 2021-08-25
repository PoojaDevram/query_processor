# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# QueryStore.destroy_all

QueryStore.create([
  { query_string: 'Select * from users;',
    run_at: Time.new("2021", "08", "23", "13", "55", "00", "+00:00") },

  { query_string: 'Select id from users;',
    run_at: Time.new("2021", "08", "23", "13", "56", "00", "+00:00") },

  { query_string: 'Select COUNT(id) from users;',
    run_at: Time.new("2021", "08", "23", "13", "57", "00", "+00:00") }
])

# User.destroy_all
# (1..10).each do |i|
#   User.create({ first_name: "First #{i}", last_name: "Last #{i}", login: "user_login_#{i}" })
# end
