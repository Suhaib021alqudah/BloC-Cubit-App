# Rick & Morty BLoC

A Flutter application that fetches and displays characters from the [Rick and Morty API](https://rickandmortyapi.com/), built with the BLoC (Cubit) state management pattern and a clean layered architecture.

---

## Features

- Browse Rick & Morty characters fetched from the public REST API
- Character cards showing image, name, species, and alive/dead status
- Search characters by name
- Episode browser screen with season selector
- Responsive UI (designed for 390x964 dp) using `flutter_screenutil`
- Dark theme with neon accent colors matching the show's aesthetic

---

## Architecture

The project follows **Clean Architecture** with four distinct layers:

```text
lib/
├── main.dart
├── business_logic/        # BLoC (Cubit) — state & business rules
│   └── cubit/
│       ├── rickandmory_cubit.dart
│       └── rickandmory_state.dart
├── core/                  # Shared utilities
│   ├── constants/         # Colors, text styles, string constants
│   └── routing/           # Route names & route generator (DI container)
├── data/                  # Data access
│   ├── models/            # JSON-serialisable model classes
│   ├── repository/        # Single source of truth
│   └── web_services/      # Dio HTTP client
└── presentation/          # UI only
    ├── screen/
    └── widget/
```

### Data flow

```text
UI (screen/widget)
  ↕  BlocProvider / BlocBuilder
Business Logic (RickandmoryCubit)
  ↕
Repository (CharactersRepository)
  ↕
Web Services (CharactersWebServices / Dio)
  ↕
Rick & Morty REST API
```

---

## Tech Stack

| Package              | Purpose                              |
| -------------------- | ------------------------------------ |
| `flutter_bloc`/`bloc`| BLoC / Cubit state management        |
| `dio`                | HTTP client for API calls            |
| `flutter_screenutil` | Responsive sizing                    |
| `google_fonts`       | Epilogue, Plus Jakarta Sans, Nunito  |
| `gap`                | Simplified spacing widget            |
| `go_router`          | Declarative navigation               |
| `flutter_offline`    | Offline connectivity detection       |

---

## Project Structure — Key Files

| File | Role |
| --- | --- |
| `main.dart` | App entry point, `ScreenUtilInit` wrapper |
| `core/routing/router_gen.dart` | Route generation + dependency injection |
| `core/routing/app_routes.dart` | Route name constants |
| `core/constants/app_colors.dart` | App-wide color palette |
| `core/constants/app_text_style.dart` | Centralised `TextStyle` definitions |
| `core/constants/strings.dart` | API base URL and route strings |
| `data/web_services/characters_web_services.dart` | `getAllCharacters()` via Dio |
| `data/repository/character_repository.dart` | Repository layer |
| `data/models/characters_model.dart` | `CharactersModel`, `Results`, `Info`, `Origin` |
| `business_logic/cubit/rickandmory_cubit.dart` | `getAllCharacters()`, `searchCharacters()` |
| `business_logic/cubit/rickandmory_state.dart` | `RickandmoryInitial`, `CharactersLoaded`, `CharactersError` |
| `presentation/screen/home_screen.dart` | Episodes browser screen |
| `presentation/widget/character_widget.dart` | Character card widget |
| `presentation/widget/list_button.dart` | Season selector button |

---

## API

Base URL: `https://rickandmortyapi.com/api/`

| Endpoint         | Used for                          |
| ---------------- | --------------------------------- |
| `GET /character` | Fetch all characters (paginated)  |

Response shape (simplified):

```json
{
  "info": { "count": 826, "pages": 42, "next": "...", "prev": null },
  "results": [
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "gender": "Male",
      "origin": { "name": "Earth", "url": "..." },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": ["..."],
      "url": "...",
      "created": "..."
    }
  ]
}
```

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.11.3`
- Dart SDK `>=3.11.3`
- An Android/iOS emulator or physical device

### Run

```bash
# Install dependencies
flutter pub get

# Run on connected device
flutter run
```

### Build

```bash
# Android APK
flutter build apk

# iOS (macOS only)
flutter build ios
```

---

## Screens

| Route | Screen |
| --- | --- |
| `/charactersScreen` | Character list (initial route) |
| `/` | Episodes browser (home) |
| `/episodeScreen` | Episode details (stub) |
| `/dimensionsScreen` | Dimensions details (stub) |

---

## Assets

```text
assets/
└── images/
    └── rickyImage.png   # Rick & Morty hero image
```

---

## License

This project is for educational/training purposes and is not affiliated with or endorsed by Adult Swim or the Rick and Morty franchise.
