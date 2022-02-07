# countries_gql
Flutter project displaying Countries data through a responsive master-detail flow consuming a [GraphQL API](https://github.com/trevorblades/countries)

## Build Instructions

1. [Install Flutter](https://flutter.dev/docs/get-started/install) on your local machine
2. Run `flutter doctor`  in your CLI to make sure you have all the necessary dependencies.
3. Clone the repo and open the project in your preferred IDE (Android Studio / VS Code)
4. To make sure you get all generated files, run
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner build --delete-conflicting-outputs
```
5. Run the application!
 - To run on web and checkout the master-detail flow responsiveness:
```
flutter run -d chrome
```
- To run on a mobile device/emulator, make sure it is connected/running and then:
```
flutter run
```

## Tests

Run all unit and widget tests available with the `flutter test` command

## Continuous Integration
Github actions have been [added to this project](.github/workflows/pr_ci.yml) to run some checks on every Pull Request.

## Design pattern and project structure
Implemented a Domain-Driven Design (DDD) where the project is separated in three main architectural layers: Presentation, Domain and Data. With these we can make our code more testable, scalable and maintainable by setting all of the core logic and global state in the domain layer, and build both UI and data layers around it.

The **Presentation layer** holds all of the widgets, their respective cubits for state management, and common UI definition classes (fonts, themes, etc...).

The **Domain layer** contains the models used around the app, a global state Singleton that holds the current session data, the use cases available for the presentation layer that coordinate any business logic, and the interface of any repository, which will be implemented in the data layer.

In the **Data layer** is stored all of the implementation of repositories declared in the domain layer (only one for this project), and the GraphQL Client and GQL Query files that communicate with our remote API.

## Folder structure
```
...
|-- countries_gql
    |-- pubspec.yaml   
    |-- assets   
    |   |-- fonts  
    |-- lib   
    |   |-- data  
    |   |   |-- gql  
    |   |   |-- mappers     // Utility classes to map GQL responses into domain models  
    |   |   |-- repo 
    |   |-- domain  
    |   |   |-- model
    |   |   |-- usecases    // Business logic calls
    |   |   |-- repo        // Repository interfaces (dependency inversion)
    |   |-- presentation  
    |   |   |-- bloc        // Widget state management cubits
    |   |   |-- common      // UI common definitions (fonts, themes, etc...)
    |   |   |-- widgets     // Contains different widgets that the HomeScreen uses
    |-- test                // Unit and Widget testing
        |-- data  
        |   |-- mappers     // Unit testing for GQL responses mapping functions
        |   |-- mocks       // Contains a mocker class that contains model mocks and generates 
                            // mockito generated files, separated from test files.
        |-- domain  
        |   |-- mocks  
        |   |-- usecases
        |-- presentation 
        |   |-- bloc        // Unit testing through the bloc_test library
        |   |-- mocks  
        |   |-- widgets     // Widget tests
        |   test_utils.dart // Reusable code for all widget tests
```

## Libraries used
- dartz: ^0.10.0: Functional programming in Dart. Used for their `Either` class that defines a possibility of a fail/success result.
- equatable: ^2.0.3: Simplifies equality comparisons for immutable objects
- flutter_bloc: ^8.0.1: BLoC state management for Flutter
- graphql: ^5.0.0: GraphQL Dart library
- mockito: ^5.0.15: Testing library
- bloc_test: ^9.0.2": Unit testing for the BLoC library
- build_runner: ^2.1.2: Code generator
- injectable: ^1.5.3: Dependency injection library. Works alongside get_it.
- get_it: ^7.2.0: Service Locator for Dart and Flutter projects

## About some decisions

### Infinite scrolling pagination
As the selected GQL API has no pagination feature for its calls, I decided to build one through containing the whole country list in domain's layer `GlobalState`, and returning the list paginated to the `CountriesCubit`, so the ListView only asks for countries as the user scrolls down.

### Why BLoC/Cubit for State Management?
The use of Cubit State Management comes from personal experience, where all the state management logic goes apart from the Widget file, in a very simple, yet elegant way.

### Why using the graphql Dart Library and not the flutter_graphql one?
Flutter_graphql is very powerful, bringing all GQL capabilities built into Flutter Widgets. But for the same reason I decided on BLoC, the intention of separating responsibilities, I preferred to move all GraphQL stuff in the data layer, away from the UI.