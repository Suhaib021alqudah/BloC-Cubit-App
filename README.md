# Rick and Morty BLoC

A Flutter training project that uses `Cubit` and a small layered architecture to fetch Rick and Morty characters from the public API and render them in a neon-styled UI.

## Overview

This project is built around two main presentation flows:

- `HomeScreen`: the current initial route. It shows an episode-themed landing screen with season chips and project styling.
- `CharactersScreen`: a character catalog screen backed by the Rick and Morty API, including client-side search by character name.

The app currently starts on `/`, and `/charactersScreen` is already registered in the router. At the moment, the home screen does not navigate to the characters screen yet, so both screens exist but are not fully connected through the UI.

## Features

- Fetches character data from `https://rickandmortyapi.com/api/character`
- Parses API responses into Dart model classes
- Uses `Cubit` for loading, success, and error states
- Displays characters in a responsive grid
- Supports live prefix search on the loaded character list
- Uses a custom dark palette and Google Fonts for the Rick and Morty-inspired look
- Uses `flutter_screenutil` with a base design size of `390 x 964`

## Tech Stack

- `flutter`
- `bloc` and `flutter_bloc`
- `dio`
- `flutter_screenutil`
- `google_fonts`
- `gap`
- `meta`

## Project Structure

```text
lib/
|-- main.dart
|-- business_logic/
|   `-- cubit/
|       |-- rickandmory_cubit.dart
|       `-- rickandmory_state.dart
|-- core/
|   |-- constants/
|   |   |-- app_colors.dart
|   |   |-- app_text_style.dart
|   |   `-- strings.dart
|   `-- routing/
|       |-- app_routes.dart
|       `-- router_gen.dart
|-- data/
|   |-- models/
|   |   `-- characters_model.dart
|   |-- repository/
|   |   `-- character_repository.dart
|   `-- web_services/
|       `-- characters_web_services.dart
`-- presentation/
    |-- screen/
    |   |-- characters_screen.dart
    |   
    `-- widget/
        |-- character_widget.dart
        `-- list_button.dart
```

## Architecture

The data flow in the character feature is:

```text
CharactersScreen
  -> RickandmoryCubit
  -> CharactersRepository
  -> CharactersWebServices
  -> Rick and Morty API
```

Responsibilities are split like this:

- `presentation`: screens and reusable widgets
- `business_logic`: cubit and state classes
- `data`: API calls, repository abstraction, and JSON models
- `core`: constants and route generation

## 📸 Screenshots

| Character Screen |
| :---: | :---: | :---: | :---: |
| <img src="HomeScreen.png" width="180">  |



## Routing

Defined routes:

- `/` -> `HomeScreen`
- `/charactersScreen` -> `CharactersScreen`
- `/episodeScreen` -> declared in `AppRoutes` but not implemented in `RouterGenerate`
- `/dimensionsScreen` -> declared in `AppRoutes` but not implemented in `RouterGenerate`

## API

Base URL:

```text
https://rickandmortyapi.com/api/
```

Used endpoint:

```text
GET /character
```

## Assets

Current project asset used by the UI:

- `assets/images/rickyImage.png`

## Getting Started

### Prerequisites

- Flutter SDK compatible with `sdk: ^3.11.3`
- Dart SDK compatible with `sdk: ^3.11.3`
- An emulator, simulator, browser, or physical device

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Build examples

```bash
flutter build apk
flutter build web
```

## Current Notes

- The characters search works on the already fetched in-memory list.
- Error handling is basic and surfaces the exception text in the UI.
- The episode chips are currently visual only.
- There is no `test/` directory yet, so automated tests are not included at this stage.

## Learning Goals

This project is a good reference for practicing:

- Flutter folder organization
- `Cubit` state management
- REST API integration with `Dio`
- JSON parsing into model classes
- Responsive UI with `flutter_screenutil`

## License

This project appears to be a training and learning project. Rick and Morty and related names/assets belong to their respective owners.
