# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting all existing articles..."

Article.delete_all

puts "All articles deleted."

puts "Creating 10 fake articles..."

10.times do
  Article.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: [
      Faker::Lorem.sentence(word_count: 5),
      Faker::Lorem.paragraph(sentence_count: 5),
      Faker::Lorem.sentence(word_count: 5),
      Faker::Lorem.paragraph(sentence_count: 5),
      Faker::Lorem.sentence(word_count: 5),
      Faker::Lorem.paragraph(sentence_count: 5)
    ].join("\n\n"),
    created_at: Faker::Time.backward(days: 365),
    updated_at: Faker::Time.backward(days: 30)
  )
end

puts "10 fake articles created!"
