**TO DO**
[x] create migrations
[x] manually add seed data
*[ ] scrape wikipedia for artists and artworks (for seed data?)*
[x] create models
[x] set up model relationships and validations
[x] test models via tux
  [x] test validations
  [x] test relationships
[x] seed database with artists and artworks
[x] set up controller files
[x] enable sessions in ApplicationController
[x] set up basic views
[x] set up routes
[x] test to make sure views work before elaborating on them
[x] user auth
  [x] sign up
  [x] login
  [x] user auth for individual pages
    [x] view a collection
    [x] users can only view/edit their own collections
*[ ] nav bar*
  [x] signup/login/logout
  [x] view artists
  [x] view artworks
  [x] user profile
  [ ] different depending on the page (but in html/css not erb conditionals)?
    (https://github.com/sydra08/exceptional-realty-bootstrapped/blob/master/new-properties.html)
  [x] remove conditionals from the navbar on pages what require the user to be logged in
[x] browse artworks
    [x] sort alphabetically?
    [ ] sort by artist?
[x] browse artists
    [ ] sort alphabetically?
    [x] sort by number of works?
[x] create a collection
  [x] add a name (required)
  [x] add any existing artworks to your collection
    [x] if none are chosen should there be a message like "this collection is empty! add some artworks to get started"
[ ] view a collection (but also the view that will link to the edit collection functions)
  *[ ] can edit the collection's name => would this just patch to the same route, but only have 1 input field?*
  [x] can remove artworks from a collection on this page (trash icon)
  [x] button to 'add new artwork'
    [x] can add ONE from the list of existing artworks
    [x] OR can add/create a new artwork
      [x] field for name (required)
      [x] field for year (optional)
      [x] field for artist
        [x] can choose from list of existing artists or create a new artist (only by name)
          [ ] make it so that if the "Other" option is selected then the name is required for the artist
        *[ ] should artworks be required to have an artist? or should there be a default value of "unknown"*
      *[ ] if an artwork starts with the word "the" you can run a search for it with and without the "the"
[x] edit a collection (add/remove existing works, update collection name)*
[x] delete a collection
  *[x] add a pop up confirmation*
[x] add error messages
  *[ ] look into AR validation messages http://edgeguides.rubyonrails.org/active_record_validations.html*
  [ ] flash messages
    [x] add flash messages to controllers
    *[ ] flash messages don't always show up properly...does this have to do with when there are multiple in a route or page?*
    [ ] maybe have standard flash messages that correspond to different actions?
      [ ] flash[:success] = "Action successful"
      [ ] flash[:failure] = "Unable to do that thing"
      [ ] flash[:auth] = "You must be logged in to do that"
      [ ] flash[:intruder] = "You cannot edit another user's collection"
    [ ] have flash messages that are determined based on the error message from the object?
*[ ] input validations*
  [x] when a user adds an artwork, should they be able to add "Mona Lisa" if "The Mona Lisa" exists?
[ ] maybe remove the 'browse artist' view for now?
*[x] style views*
[x] decide if i want to have default values for things in tables or just handle another way in erb

Misc
[x] style the input boxes differently
[ ] fix the padding on the sidebar div on the homepage
[ ] style the checkbox lists differently
[x] change the background color
[x] find a new google font?
[x] why are the edit routes showing up with ? at the end...need to investigate buttons more when I work on styling the routes
[x] add trash can and pen icons to the "all collections" view
[x] add trash can and pen icons to the "single collection" view
[x] add http://google.github.io/material-design-icons/ to fonts (icons)
  [x] edit = <i class="material-icons">mode_edit</i>
  [x] delete = <i class="material-icons">delete</i>
<!-- [ ] should a user only be able to edit an artist's details but not their artworks?
[ ] should you be able edit an artwork's artist? -->
[x] should ids or slugs be used => is it bad practice to expose the id of an object?
[x] when you're creating a collection should you be able to select from a dropdown menu?
[x] review all of the messages/verbiage before submitting
[x] how can I make it so that form buttons look prettier
[x] figure out how to replace the form buttons with other icons
[x] research what the best way to pass information between views/routes is and not stuff from user input. should you still use params?
<!-- [ ] add tables to layouts to organize content better -->

Required for go live
[x] reset database and re-seed before submitting
<!-- [ ] write out a test spec? -->
[x] write readme.md
[x] fill out spec.md
[x] remember to log test user out before submitting and running migrations
[ ] add user to seeds.rb so there's something to run user validations against?

Enhancements/Improvements for a later iteration
+ if you add an artist to your collection, by default all of the artworks are checked off
+ collections can have a description
+ have different navbar sections?
+ allow users to add/edit artworks in the database?
+ allow users to add/edit artists in the database?

Items for Refactoring
[ ] have /collections/:collection_id/ routes inside ArtworksController for
  [ ] edit (adding artworks)
  [ ] show (displaying collection)
[ ] look for more repetitive code instances => ie. authenticate_user situation
[ ] write out tests!
  [ ] start with small unit tests on models
  [ ] then work on association tests with the Shoulda gem
*It's like running a marathon - you start with running a mile or 2 and then build up from there*

**Basic Outline of App**

+ A user can create a collection
+ A user can view, edit and delete a collection that belongs to them
  + A user can view their collection by artist or by artworks
+ When a user creates a new collection they can add a new or existing artwork or a new or existing artist to their collection
  + If a user adds an artist to their collection, they will be prompted to select which pieces by an artist they would like to add to the collection
+ A user cannot delete an artwork or an artist from the database
+ A logged in user can view a list of all the artists in the database
+ A logged in user can view all of the artworks in the database
+ A logged in user can view a single artist and all of the associated artworks
+ A logged in user can view a single artwork and the artist it is associated with

**Model Relationships**

+ An artist has_many artworks

+ An artwork belongs_to an artist
+ An artwork has_many collections through collection_artworks

+ A collection has_many artists through artworks
+ A collection has_many artworks through collection_artworks
+ A collection has_many collection_artworks

+ A user has_many user_collections
+ A user has_many collections through user_collections

+ A user_collection belongs_to a user
+ A user_collection belongs_to a collection

+ A collection_artwork belongs_to an artwork
+ A collection_artwork belongs_to a collection

**Questions**

Seed DB - top 25-50 artists & top 25-50 artworks?
Can a user add an artist without any artworks?
If a user tries to add an artist that already exists they are denied?

**Database Schema**

*Collections*
collection_id INT (PK)
name STRING (required)
comment TEXT

*Collection_Artworks*
collection_artworks_id INT (PK)
artwork_id INT (FK)
collection_id INT (FK)

*Artworks*
artwork_id INT (PK)
artist_id INT (FK)
name STRING (required)
year INT (optional?)

*Artists*
artist_id INT (PK)
name STRING (required)
style STRING
location STRING
birth_year INT
alive BOOL

*Users*
user_id INT (PK)
collection_id INT (FK)
username STRING (required)
password_digest STRING (required)
email STRING (required)

*User_Collections*
user_collections_id INT (PK)
user_id INT (FK)
collection_id INT (FK)
