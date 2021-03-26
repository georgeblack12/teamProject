# Overview of Structure of Program

- All Java code can be found in /src/main/java

- CSS and images can be found in /src/main/resources/static/css and /images respectively

- Connection with the database is established in /src/main/resources/application.properties

- SQL scripts for creating the database and the queries used for analytics can be found in /src/main/resources/icesystem.sql

- Javascript and HTML can be found in /src/main/webApp/javascript and /pages respectively

- JUnit testing can be found in /junit and /src/test

## Package structure

Within /src/main/java/com/project/cavallo we have the following packages:

- controller: Package used to get JSONs sent from the client and either store them in the database or 
send a JSON back to the client.

- dao: Package used to make the queries and insert values into the connected database. 

- domain: Package containing classes where each class is used to make objects of the JSONs sent between the frontend 
and backend. These classes are to be used in the controller package.

- service: Package used to help with the Logging in of a User to the website. 