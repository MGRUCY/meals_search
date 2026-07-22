# Meals Search Rework

A simple Flutter app that searches for meals using the free TheMealDB API, lets the user rate a meal under a nickname, and saves those ratings locally on the device.

## About

This is a personal Flutter learning project. The name suggests it's a rework of an earlier, simpler "meals" exercise (a common pattern in Flutter courses/tutorials), extended here with a search screen backed by a real API plus a nickname + star-rating + local-save feature on top of the original meal-detail concept.

The app lets a user search TheMealDB for meals by name, open a meal's detail screen (thumbnail, region of origin, and a link to a YouTube video for the recipe), leave a nickname and a star rating for that meal, and later browse everything they've rated on a separate "Saved Ratings" screen.

## Features

- Search for meals by name against TheMealDB's public REST API
- Browse search results in a list with thumbnail images
- View a meal detail screen showing its thumbnail, area/region of origin, and a tappable YouTube link (opens externally)
- Enter and validate a nickname through a form before rating a meal
- Rate a meal with a 5-star widget that supports half-stars (tap for a full star, double-tap for a half star)
- Save a nickname + star rating + meal to local device storage
- View all previously saved ratings (meal name, nickname, and stars) on a dedicated screen

## Flutter Concepts Used

- **Navigation** – `Navigator.push` / `MaterialPageRoute` between the Home, Meal Detail, and Saved Ratings screens
- **Forms & Validation** – `Form`, `TextFormField`, `GlobalKey<FormState>`, and a required-field validator for the nickname
- **Custom Widgets** – `NicknameForm`, `StarRating`, and `SaveButton` extracted as reusable widgets
- **State Management** – plain `StatefulWidget` / `setState`; no external state management package is used
- **REST API integration** – fetching data over HTTP with the `http` package
- **JSON Parsing** – `fromJson` / `toJson` methods on the `Meal` and `MealRating` model classes
- **Local Storage** – persisting saved ratings with `SharedPreferences` (encoded as a list of JSON strings)
- **Basic Theming** – a single `ThemeData(primarySwatch: ...)` in `MaterialApp`
- **External URL launching** – opening a meal's YouTube link via `url_launcher`

## Packages Used

- `http` – calls TheMealDB's search endpoint and parses the JSON response
- `shared_preferences` – persists saved meal ratings on the device between app runs
- `url_launcher` – opens a meal's YouTube link in an external browser/app

## Screenshots

> Add screenshots here.

## Learning Purpose

This project looks like it was built to practice: calling a public REST API and turning the JSON response into Dart model objects, wiring up navigation across multiple screens, building and validating a form, creating a small custom interactive widget (the star rating), and persisting simple structured data on-device with `SharedPreferences` instead of a full database.

## Notes

- All meal data and images are fetched live from [TheMealDB](https://www.themealdb.com) — no meal data or images are bundled with the app.
- A few rough edges from development are still visible in the source, which is normal for a learning project: the saved-ratings list is named `pubg`, the save button's label reads "Save pubg", `_loadRatings()` calls `MealStorage.loadRatings()` twice, and one debug `print` statement logs the `dart:convert` `json` object itself rather than the encoded rating string.
