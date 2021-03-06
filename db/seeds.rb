5.times do
  RegularUser.find_or_create_by(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: Faker::Avatar.image(size: "50x50", format: "jpg"),
    password_digest: "password"
  )
end

100.times do 
  quote = Faker::Movie.quote
  book_title = Faker::Book.title
  submitted_by = RegularUser.order("RANDOM()").first
  BookQuote.create(quote: quote, book_title: book_title, regular_user: submitted_by)
end