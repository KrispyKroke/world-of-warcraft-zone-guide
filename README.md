
# World of Warcraft Zone Guide

## Description

Duration: 2 weeks (3-6 days of additional time for scoping)

For this project, I decided to make an interactive player guide for people interested in playing World of Warcraft Classic.  New players to the game will likely have no context or understanding of the game world, and may want another resource to show them all that they can experience in the game.  This application allows a user to create characters of all types and explore the vibrant and detailed universe of World of Warcraft Classic through interactive pages with game information.


## Screenshots

## Welcome Page

The user is greeted by this page when the app is booted up.

<img width="1246" alt="Screen Shot 2022-03-12 at 4 54 04 PM" src="https://user-images.githubusercontent.com/91631646/158037853-3e7384c5-cbd6-4d24-a45f-71f942a4c45b.png">

## Character List Page

Here is the page where the user can add and delete characters, as well as go to the zone for that character.

<img width="1234" alt="Screen Shot 2022-03-12 at 5 01 20 PM" src="https://user-images.githubusercontent.com/91631646/158037993-592decc4-75a8-45fc-a195-9f2a6ec617af.png">

## Zone Page for Desolace

This is just 1 of 38 zones which are included in this application.

<img width="1249" alt="Screen Shot 2022-03-12 at 5 01 52 PM" src="https://user-images.githubusercontent.com/91631646/158038031-41884626-1d00-46f8-a091-12dd54714496.png">

## Map of Desolace on Zone Page

Here is the map on the page shown above.

<img width="1210" alt="Screen Shot 2022-03-12 at 5 02 06 PM" src="https://user-images.githubusercontent.com/91631646/158038100-f1a301ed-3ed4-496b-9eaa-951c0eeac4e3.png">

## Quest List Page for Desolace

37 of 38 zones display 3 quests per zone on this page.  The user can check off quests for their character on this page.  Deadwind Pass is the one zone included in the app with no quests available.

<img width="1234" alt="Screen Shot 2022-03-12 at 5 05 36 PM" src="https://user-images.githubusercontent.com/91631646/158038125-5fd27f37-aaca-4936-8a0f-609d292c86a3.png">

The images above are not comprehensive.  There are other pages in the application which the user can see and interact with that are not shown here.

## Prerequisites

Before you get started, make sure you have the following software installed on your computer:

- [Node.js](https://nodejs.org/en/)
- [PostrgeSQL](https://www.postgresql.org/)
- [Nodemon](https://nodemon.io/)

## Installation

1. Fork the repository and clone it to your machine
2. Create a database in Postico called `wow_zone_guide_solo_project`.
3. Insert the queries from the database.sql file and run them to populate the database.
4. Open up your terminal, navigate to the project folder, and run an `npm install`.
5. Start your server with `npm run server`.
6. Start up your client with `npm run client`.
7. Navigate to localhost:3000 if you have not automatically.

## Usage

1. After starting up the application, you should register a new user. This will log you in automatically.
2. You will see a map of the game world.  You can click on the buttons below to navigate to pages for each capital city in the game.  There is information about each city on their respective page.
3. You should see a Nav-Bar on the banner at the top of the browser screen.  While logged in, you can navigate to the world map page, the character list page, and the home page by logging out as well.
4. If you go to the characters page, you can add a character to your list by filling out the inputs.  You can add up to 20 characters per user.  You also have the ability to delete characters.  If you click the `Go to Zone` button for a character, you willl be transported to the appropriate zone page.
5. On the zone page, you will see information about the zone, and you will also have the option to see further details about the zone, as well as the ability to go to a quest list page for that zone.
6. On the quest list page, the quests shown to you have completion statuses which are unique to that character.
7. This means that each character can complete any quest, and if they complete a quest it will only mark that quest as completed for that character.
8. It should also be noted that there is an Admin page for users with Admin status where all non-Admin users can be viewed in a table.  Any of these users can be deleted by an Admin.  There is a query in the database.sql file to upgrade a user to Admin status.

## Built With

- React
- Redux/Sagas
- SQL
- Javascript
- Express
- Bootstrap

## Acknowledgement

I would like to thank my instructor and classmates at Emerging Digital Academy for supporting me in my endeavor with this project.

## Support

If you have suggestions or issues, feel free to contact me at jared.kroke@gmail.com.

