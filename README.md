# README

* Notes

  * This is the first app I've written in Rails. It's a basic URL shortener that will take a URL that you give it and shorten it to [hostname]/[hash], where hash is a base62-encoded alphanumeric hash of the database id for the row containing the full URL you entered. If you try to visit an invalid URL, either one containing invalid characters or one with a hash that doesn't correspond to a DB entry, you will be redirected to an error page.

  * Future updates to make:
    * Add in check if URL already exists in database, and return hash for that entry instead of adding a new one
    * Add more detailed unit testing of show method in controller

* Ruby version
  * ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]
  * Rails 5.1.3

* Configuration
  * Update the URL in config/environments/production.rb to reflect the production URL you will be using

* Database
  * This app uses sqlite3 as the database

* How to run the test suite
  * There are tests in test/controllers/ and test/helpers/
