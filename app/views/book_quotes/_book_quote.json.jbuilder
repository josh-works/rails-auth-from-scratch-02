json.extract! book_quote, :id, :quote, :book_title, :references, :created_at, :updated_at
json.url book_quote_url(book_quote, format: :json)
