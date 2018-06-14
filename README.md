# LocalVeggies - ( A Ruby on Rails 2 Sided Marketplace Project)

Deployed: [https://thawing-ravine-69982.herokuapp.com/](https://thawing-ravine-69982.herokuapp.com/)

Github: [https://github.com/natalieytan/teamplayers](https://github.com/natalieytan/teamplayers)

# Contents

- [Concept](#concept)
  * [Problem Statement:](#problem-statement-)
  * [Solution](#solution)
- [Design Process](#design-process)
  * [User stories](#user-stories)
  * [Sitemap planning](#sitemap-planning)
  * [My Scrumboard](#my-scrumboard)
  * [ERD](#erd)
  * [Wireframes](#wireframes)
- [Plans for future development](#plans-for-future-development)
  * [Plan for More features](#plan-for-more-features)
  * [Cleaner code](#cleaner-code)
  * [Write  tests](#write-tests)
- [Local installation instructions](#local-installation-instructions)


# Concept
## Problem Statement:
Local Veggies market is an idea to promote growing local vegitables and making them available at the right time,  as opposed to the industry standard which takes the value of the product. 


## Solution
The idea is to develop a web page so local population can have a overview on what is avalable where and at what time. The initial idea was to start whith loose solution (not comercial) to cater for exchange, donation and sale of veggitables.

Later on I did change it to standard ordering system which will be part of any future solution anyhow. I had the database diagram taken from a project I had chance to look into years ago. This solution had a temporary table to store cart items and once the user decides to buy the application in the background creates new order, retrieves the order number for that new order then it puts the items from the cart into order line table against the new order number. Next thing the application calculates the total for the order and  processes the payment of that amount. All this is put into a transaction and if any chain fails the transaction is rolled back.
I was aware that this design might not be completely suitable for a rails application as rails has quite specific approach but I wanted to test one thing. Namely I wanted to see if rails can update data in more tables in a single transaction (one trip to the server). With the experience I had there was clear distinction between program witch was using updates on a single table at the time and program able to handle transaction. The last one was considered a thing which required more professional approach.



# Design Process
## User stories
![User Stories](/app/assets/images/readme/userstories.png)
[Trello Board](https://trello.com/b/WVOpDE4j/localvegies)

I was able to speak to a few people who live in my area and who grow vegitables. Some of them have developed this trade to perfection and their garden looks like an art work. My wife also grows veggitables but her garden looks like jungle, though the vegitables are exellent.

Their stories are a trello board. It was interesting to note, different users had different visions of what their ideal application would encompass.

Given the variety of opinions despite the small sample size, it would be ideal to conduct more research over a longer period.

## Sitemap planning
I haven't done site planning and a scrumboard as I was more concentrated on the functional side of the application.

If I had more time I would plan part of the application after the user buys the cart products. Then the application would complete the order processing in the backgoround and would display the newly created order

## My Scrumboard


## ERD
![ERD](/app/assets/images/readme/erd.png)

The main part of the diagram is Orders and OrderLineItems which is standard design for this type of application. An Order has many OrderLineItems and a relationship is with a foreign key. For data integrity this relationship is enforsed (do not accept null values for a foreign key). The applicatin is using a Cart table what is replica of OrderLineItems table. The user will add items to this table as he desides to buy them and when done he pays the items. At that poing the application in the background creates new order, retrieves the order number for that new order then it puts the items from the cart into order line table against the new order number. Next thing the application calculates the total for the order and  processes the payment of that amount. All this is put into a transaction and if any chain fails the transaction is rolled back.



## Wireframes
![Figma](/app/assets/images/readme/wireframes.png)
- Font choices: Bree Serif, Open Sans
- Colors
    - White & red and green as base colors
    - Golden as Secondary color
 
This part was not implemented and the application has quite plain appearance

# Plans for future development
## Plan for More features
Some 'nice to have' features (which are quite feaible) I wish to implement in the future
- Ability to be able to exchange vegitables
- ability to offer vegitables for free
- User to user messaging



## Cleaner code
- In writing code in rails, as the view could access the database, it was often easy to forget that the cost of the queries, especially if there were multiple joins.
- While I tried to reduce n+1 queries by prefetching joins in the controller as much as possible, there were instances this slipped through.
- Ideally I would like to use `rack-profiler` and `rubocop` to reduce the bloat.

## Write more tests
- I would love to be able to have write more tests before actually writing code. 
- However, given my limited knowledge of writing rspec for rails at this stage, I found that I was actually writing code to test & learn how to write my tests.
- I aim to continue writing more tests and adopt test driven development.


# Local installation instructions
1. Run a postgres database in the background
2. `make sure there are images of vegitables in app/assets/images/` 
3. `bundle install`
4. `bin/rails db:migrate`
5. `bin/rails db:seed`
6. `bin/rails s`



# Acknowledgements
Many thanks to my friends and the teachers at coder academy.

