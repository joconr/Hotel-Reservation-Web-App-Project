# Hotel Reservation Project
## Overview
During my Web Applications and Development class, I gained a multitude of skills that pushed me towards becoming a proficient full-stack developer. This repository features all the code I developed to create a mimicked version of a hotel website. For this project in particular, I created a mock version of a website dedicated to The Venetian Resort in Las Vegas. It allows users to read about the hotel, look through a set of rooms (and their amenities), and ultimately fill out a form allowing them to reserve the room on a particular date of their choosing. I took a lot of inspiration from the Expedia website; however, I also added my own twist to it. 

## Backend Code
The first part of this project involved setting up the backbones of the website. The beauty of the website design is that it is almost completely dynamic, meaning that most of the information being featured is data being pulled from a MySQL database that I set up. SQL for setting up the schema and inserting data can be found in the "Project Details & Data" folder. 

## Frontend Code
The frontend is what took the majority of my time designing for this project. I leveraged node.js packages like express, ejs, body-parser, and mysql to allow it to be hosted on port 3000 and dynamically feature data pulled from the database. Multiple ejs files for each of the pages exist in the views folder that contain the html that allows for this data to be dynamically pulled. 

The room page also features a bit of JavaScript magic that utilizes JQuery features like AJAX to bring the page to life and make it more interactive. For example, room amenities display upon the mouse hovering over individual rooms. 

I created a reservation form that allows for users to select a room they'd like to reserve, fill out information pertaining to themselves, and submit. The code I've created automatically inserts this information back into a reservation table that exists in my database. I've even included a feature that has it check to make sure that the room isn't reserved at any point during that timeframe. If so, it will return an error message for the user. 

In addition, I spent a lot of time adjusting the style of the website to look as professional as possible. In the public folder, there are folders for images, but more specifically a folder that contains a CSS file that adjusts the styles of the website body, classes, etc. I'm proud of the way it turned out, but there's a bunch of ways I could see going about improving it for future use. 

## Conclusion
I had a great time working on this project as it covered a great deal of content that I learned in my Web App and Dev class. I am confident in my ability to say that I've taken some major strides towards becoming a full-stack developer at this point. Feel free to check out my project regarding how I made my Cloud Resume as it was a bit similar to this, but instead the entire website was built using AWS as a platform. 

Here are the links to that project's repositories if you're interested:

https://github.com/joconr/Cloud-Resume-Project-Frontend

https://github.com/joconr/Cloud-Resume-Project-Backend
