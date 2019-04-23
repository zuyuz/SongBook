# SongBook

[![Build Status](https://dev.azure.com/mrnyaaa/Songbook/_apis/build/status/zuyuz.SongBook?branchName=master)](https://dev.azure.com/mrnyaaa/Songbook/_build/latest?definitionId=1&branchName=master)

Project's CI/CD tool: [Azure DevOps](https://dev.azure.com/mrnyaaa/Songbook)

## Description
Application that allows you to create your own songbook easily. 
You can write your own songs, collect and store favorite lyrics, choose the fanciest design and print them out.

## UML Diagram 
[UML Diagram](https://drive.google.com/file/d/17Vl_3hDufYvUvpQMxqqiQVeqIDfhqM5N/view?usp=sharing) 

## Creators
Mrrrnyaaa team

## Database
We use a Firebase Realtime Database (No SQL) for saving users and generated songbooks.
Data consists of 2 parts: 
 - User database: 
    Includes all application users.
 - Application database: 
    Includes user generated JSON objects. 
    Each object includes:
      - List of songs' lyrics
      - Number of songs

 

## Security
Authentication is managed through the Firebase Auth. Screenshots for the auth configuration pages are located in the /Security folder.

## Hosting service
Our application may be uploaded to the AppStore.

## Monitoring & Telemetery
We use Firebase Analytics and Crashlytics to monitor database, cloud functions and app usage and also to receive detailed reports of the errors in your SongBook application. You can find screenshots in the /Analytics folder.

## Songbook prototypes
Songbook prototypes are created by using [Marvel](https://marvelapp.com) and can be reviewed [here](https://marvelapp.com/ba82087).
