# NuConta Marketplace 🛒

NuConta Marketplace is the code challenge that was assigned to me in this interview process by NuBank.
Consists of a Flutter based app that consumes a GraphQL based API

The app itself it's a Rick and Morty themed marketplace where  you can buy various items from the show.


<p float="left">
    <img src="https://i.imgur.com/LlETD7x.png" width="200" height="75%">
    <img src="https://i.imgur.com/jS2avIO.png" width="200" height="75%">
    <img src="https://i.imgur.com/uQ4f7PY.png" width="200" height="75%">
    <img src="https://i.imgur.com/k8cjSdN.png" width="200" height="75%">
</p>

The goal was to:
- fetch the Customer data
  - Stuff like their name and balance
- Offers they had including the products
  - Image, name, price, description
- Attempt to purchase and parse it's response
  - Update the balance when something is purchased
  - Parse if I got a Successful purchase or errors such as no money or promotion expired

## Download

Clone the [git repository](https://github.com/JesusRojass/nuconta_marketplace) to your computer.

```bash
git clone https://github.com/JesusRojass/nuconta_marketplace.git 
```

## Installation and Running the Project

After cloning the repository to your computer you may need to run the following command to install the project dependencies.


```bash
flutter pub get
```

Then you can just run the project with your Android or iOS device using.

```bash
flutter run
```


## The Approach
My approach begins with analyzing the project, with obviously first reading what I got sent.

Then I began my creating a plan which looked like this:

- Tasks in relation with the API
  - Figure out GraphQL Queries
  - Figure out how many Objects I had and their properties
  - Figure out how the responses worked
  - Figure out the Purchase Mutation so I could have purchases in the app
  - Got cool little graphs thanks to a project called [GraphQL Voyager](https://github.com/APIs-guru/graphql-voyager), I used postman at first to do the introspection Query to figure out the entire tree but ended up moving to Insomnia like you guys reccomended because it was truly easier. I was able to query and make a Mutation which was all I needed to begin!


<p float="left">
    <img src="https://i.imgur.com/MQQT0ST.png" width="800" height="75%">
    <img src="https://i.imgur.com/3Uk58wy.png" width="800" height="75%">
    <img src="https://i.imgur.com/XEvtsUl.png" width="800" height="75%">
    <img src="https://i.imgur.com/MQQT0ST.png" width="800" height="75%">
    <img src="https://i.imgur.com/cjZvFUB.png" width="800" height="75%">
</p>

- Tasks in relation with the app itself
  - Come up with an App Flow, How's the app going to work?
  - Defined I wanted to do a Navigation Bottom Bar styled app (Like most mobile marketplaces apps)
  - Drew some screens on paper (Image Below)
  - Create my Flutter project
  - Setup a Git Repository
  - Install libraries I may need
  - Create folders so I can have a well structured project
  - Create my App Skeleton (Navigation controller and such with Navigation bar callbacks)
  - Created my Data models (inside of lib/model) where I contain the products, offers and user data models
  - Created my views (inside of lib/view) where I have everything related to the visual side of the app
  - Created my Data models (inside of lib/controller) where I consume my queries and parse the data to the be used by my views
  - Created my config (inside of lib/config) where I keep data such as the api url, token and queries
  - Created my utilities (inside of lib/utils) where I keep misc functions that help me achieve stuff such as intializing my GraphQL Client, User Preferences and Json Utilites


<p float="left">
    <img src="https://i.imgur.com/Tvh6xoU.png" width="800" height="75%">
    <img src="https://i.imgur.com/vpHK1fj.png" width="800" height="75%">
</p>


With all that now out of the way I want to talk about the libraries that I used and their purpose

- [GraphQL](https://pub.dev/packages/graphql)
  - This helped to consume the GraphQL Queries and Mutations
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
  - This helped me to store the user and give continuity to it's balance because the API no matter what it gave me the same amount remaining of the balance even though I purchased the same product multiple times. So my approach was to save the data in the device and after each purchase decrease the amount with it'srespective value. I added a button to reset the demo data and I believe because of the way I initialize everything the data gets reset on every app restart (First Launching the app may take a little second to fetch for the first time)
- [URL Launcherr](https://pub.dev/packages/url_launcher)
  - This helped me to launch some web pages in the about section of the app 🙂

With all this out of the way I hope you like my Code Challenge and if you have any questions feel free to reach me back! 🎉