require "application_system_test_case"

class BookQuotesTest < ApplicationSystemTestCase
  setup do
    @book_quote = book_quotes(:one)
  end

  test "visiting the index" do
    visit book_quotes_url
    assert_selector "h1", text: "Book Quotes"
  end

  test "creating a Book quote" do
    visit book_quotes_url
    click_on "New Book Quote"

    fill_in "Book title", with: @book_quote.book_title
    fill_in "Quote", with: @book_quote.quote
    fill_in "References", with: @book_quote.references
    click_on "Create Book quote"

    assert_text "Book quote was successfully created"
    click_on "Back"
  end

  test "updating a Book quote" do
    visit book_quotes_url
    click_on "Edit", match: :first

    fill_in "Book title", with: @book_quote.book_title
    fill_in "Quote", with: @book_quote.quote
    fill_in "References", with: @book_quote.references
    click_on "Update Book quote"

    assert_text "Book quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Book quote" do
    visit book_quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book quote was successfully destroyed"
  end
end
