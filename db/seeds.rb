# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.destroy_all
AdminUser.destroy_all

# NUMBER_OF_CUSTOMERS = 6
6.times do
  customer = Customer.create(
    full_name:    Faker::Name.unique.name,
    phone_number: Faker::PhoneNumber.cell_phone,
    notes:        Faker::Lorem.sentence(word_count: 4)
  )
  # fetch and display the aaplicaiton with customer images
  query = URI.encode_www_form_component([customer.full_name + "people"])
  downloaded_img = URI.open("https://source.unsplash.com/200x100/?#{query}")
  customer.image.attach(io: downloaded_img, filename: "m-#{[customer.full_name]}.jpg")
  # sleep(1)
end

puts "Created #{Customer.count} customers."

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
