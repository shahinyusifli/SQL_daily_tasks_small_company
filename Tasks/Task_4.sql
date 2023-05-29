-- Create the data model for a restaurant chain database according to the following information:

-- Organization has restaurant chain (of which you want to store address, city, country, restaurant name and branch phone numbers (operator, kitchen, accounting). Each restaurant has seating tables with different seat count and types. Chain has flagship restaurant. 
-- Restaurant clients are registered in restaurant database by operators while caller is making reservation. Information about operator contains name, surname, person identification number, personal phone number, branch where he is sitting (physically working) and restaurant for which he is making reservations. Client data could contain information about client name, surname, phone number and operator comment (discounts, allergens, etc.). Reservation can be made by everyone who call to restaurant operator (do not need store information about calls). While operator is creating reservation, he is asking name, phone number, restaurant name (address), seating information, date, time and offers caller became as client. Operator can add comment about reservation. 
-- Answer: 
-- I made 7 tables which can be seen in the attached pdf file. Also, I made them in https://dbdiagram.io/  which I had a chance to use some structural text for creating a data model therefore I want to share them. If there is some misunderstanding happen in a pdf file or some problems about something, they can be seen with them:
Table Restaurant  {
  id int [pk, increment] 
  address varchar
  city varchar
  country varchar
  restaurant_name varchar
  branch_id int [ref: > Branch.id]
  tables_id int [ref: > Restaurant_tables.id]
  
}

Table  Restaurant_tables{
  id int [pk]
  seat_count int
  types varchar
 }

Table Branch {
  id int [pk, increment] 
  branch_phone_numbers varchar
  branch_name varchar
}

Table Comment {
  id int [pk, increment] 
  comment_type varchar
  description varchar
}

Table Clients {
  id int [pk, increment] 
  name varchar
  surname varchar
  phone_number int
  comment_id int [ref: > Comment.id]
}


Table Operators {
  id int [pk, increment]
  name varchar
  surname varchar
  personal_identification_number int
  phone_number int
  branch int [ref: > Branch.id]
  restaurant_id int [ref: > Restaurant.id]
}


Table Reservation {
  id int [pk, increment]
  phone_number int [ref: > Clients.phone_number]
  restaurant_id int [ref: > Restaurant.id]
  seating_table_id int [ref: > Restaurant_tables.id]
  date datetime
  time timestamp
  comment_id int [ref: > Comment.id]
}





