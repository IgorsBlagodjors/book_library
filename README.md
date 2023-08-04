# book_library
A new Flutter project.

## Description

- Application created  to search for Books using Google Books API (https://developers.google.com/books).

# Home page
- The home page displays a list of books fetched from the Google Books API.
- There is a search functionality implemented to allow users to search for specific books.
- Each book item shows an icon (star) that represents the book's average rating, and the number of votes is displayed as well.
- Clicking on a book item opens the details page, showing short information and a description of the book.
- The details page also includes an "Add to wish list" button at the bottom right, allowing users to add the selected book to their wish list.
- To manage the wish list, a free Restful API (https://restful-api.dev) is used. 
- The wish list data is also stored locally on the phone using shared preferences, ensuring that the data persists even after the application is reloaded.

# Wish List
- Wish list is available dismissible widget to remove book from the wish list.
- Users can remove a book from their wish list, and there is an "undo" function that allows users to recover accidentally deleted items.

# Other functionality
- Splash
- App icon
- English, Latvian, Russian localizations.

