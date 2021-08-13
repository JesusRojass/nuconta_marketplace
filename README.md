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
My approach begins with analyzing the project
