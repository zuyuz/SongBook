# SongBook

## Description
Application that allows to create your own songbook easily. 
You can write your own songs, collect and store favorite lyrics, choose the fanciest design and print them out.

## UML Diagram 
[UML Diagram](https://drive.google.com/file/d/17Vl_3hDufYvUvpQMxqqiQVeqIDfhqM5N/view?usp=sharing) 

## Creators
Mrrrnyaaa team

## Database
We are using firebase real-time database (No SQL) for saving users and generated song books.
Data consist of 2 parts: 
 - User database: 
    Includes all application users.
 - Application database: 
    Includes user generated JSON objects. 
    Each object includes:
      - Songs texts (as list)
      - Number of songs

 

## Security model
Auth is managed through firebase auth. Find images, in security folder, for auth configuration pages.

## Hosted service
Our application may be uploaded to the AppStore.
