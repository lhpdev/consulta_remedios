# README
  This is a simple Rails project which allows user to select items from a stock and add them to a cart

* Ruby version
  - ruby '2.7.1'
  - rails '6.0.3'

* System dependencies
  - The project uses bootstrap. For that reason you will have to have yarn installed in your computer to run the project locally.
  - Yarn (https://classic.yarnpkg.com)
  - After installing yarn run: ```Yarn add bootstrap jquery popper.js```

  - Postgresql

* Database creation
  - Run: ```rails db:create```

* Database initialization
  - Run: ```rails db:seed```

* How to run the test suite
  - Run: ```rspec spec```

* Considerations
  - The project startup from https://github.com/ConsultaRemedios/test_cr_api) had a medicine model, which had an attribute 'quantity' on its table. However it alse had the 'stock' attribute and I assumed that the right attribute to save the information about the number of items from a medicine is the 'stock' attribute. Therefore the 'quantity' attribute from the Medicine model was not used at all.

  - Also, to allow customers to have multiple carts, I have added a status enum to the model specifying if it is active or completed. The application will always try to get the last active cart. If it doest find any, it will create a new one.

* Running the project:
  - Start the application from the root route: '/' which is going to ask the user to select a customer to start shopping.

  - User actions:
    - Add item to cart
    - Remote item from cart
    - Purchase a cart
    - Discard a card
