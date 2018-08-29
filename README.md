# TakeAwayWeb

## Dependencies

  - postgres Sql
  - Ruby v 2.5 or newer
  - Bundler/Bundle
  - Any web compatible browser
  
## Installation

To use the application simply clone/ download this repo. To install the required gems run `bundle` in cmd/ terminal, then enter `ruby app.rb` to start the server. You should then be able to visit the page by visiting `localhost:4567/` in your browser of choice.

## Testing

The testing for this project is done in Rspec (unit tests) and Capybara (feature tests), by running bundle you should be able to run the tests by entering the command `rspec` in your terminal. To write new tests simply create a new *_spec.rb* file within the **spec** or **spec/features** directory.

## Usage

This program simulates a food take away website: allowing for any created menu to be displayed to the user, providing one click ordering and a virtual shopping basket containing any ordered items. The menus for this application take the form of *postgres* databases, so one such database must be created in order for the application to work, do this with the following command:

  ```
    psql
    CREATE DATABASE take_away_web; CREATE DATABASE take_away_web_test;
 ```
 In order for full program functionality the following commands must be run for **each** database
 
 ```
  CREATE_TABLE menu (
    Serial Primary Key,
    item_name varchar(40).
    item_price int4,
    item_quantity int4
  );
 ```

The application also includes an unfished developper environment, when active the user is able to create menu tables using an interactive Gui, which then processes the user requests in the form of Seql queries.
