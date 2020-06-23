# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


* Considerations
  - On the medicines model, there was a attribute 'quantity' which for me didn't have any use because I assumed that the attribute which is the right one to save the quantity of items from that medicine within stock is the 'stock' attribute

  - Also, to allow customers to have multiple carts, I have added a status enum to the model specifying if it is active or completed. The application will always try to get the last active cart. If it doest find any, it will create a new one.

* ...
