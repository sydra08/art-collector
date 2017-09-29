# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class - Artist, Artwork, Collection, and User
- [x] Include at least one has_many relationship - A User has_many Collections, a Collection has_many Artworks, and an Artist has_many Artworks.
- [x] Include user accounts - Users have to be registered in order to create and manage collections.
- [x] Ensure that users can't modify content created by other users - Checks that the user is logged in and if the collection belongs to the user.
- [x] Include user input validations - Some fields are 'required' in the forms. There are also several validations in the Artist, Artwork, Collection and User models to ensure that certain information is present. There are also some validations that check for uniqueness.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - Uses Rack::Flash to collect and display messages.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
