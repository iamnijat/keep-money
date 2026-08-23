![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/iamnijat/keep-money/Flutter%20CI/master)
![GitHub forks](https://img.shields.io/github/forks/iamnijat/keep-money)
![GitHub stars](https://img.shields.io/github/stars/iamnijat/keep-money)
![GitHub watchers](https://img.shields.io/github/watchers/iamnijat/keep-money)
![GitHub contributors](https://img.shields.io/github/contributors/iamnijat/keep-money)
![GitHub last commit](https://img.shields.io/github/last-commit/iamnijat/keep-money)
![GitHub top language](https://img.shields.io/github/languages/top/iamnijat/keep-money)

# Flutter Keep Money Application


![thumbnail](https://user-images.githubusercontent.com/42466886/185780701-c94b156a-4274-4b7f-b5c7-e14a8cc724da.png)


## Supported Null safety

### Project architecture (Clean Architecture Approach)
##### 1. Why:
    * We want to determine what types of database that we use for storage (might want to change it later on)
    * We want to adhere to SOLID principles since we are using OOP for this project.
    * We want to ensure that UI layers do not care what is going on at the data layer at all.
    * We might want to separate each layer into different packages.
##### 2. Presentation - Domain - Data - Core - Config.
##### 3. Presentation layer consist of
    * Modal Sheets
    * Pages
    * Widgets
    * Cubits
    * Cubits are important for only managing UI state based on business logic

##### 4. Domain layer (Business logic layer)
    * Usecases (user stories)
    * Repositories interface
    * Typically one function, but can be more if functions are related.
    * Remember, one class has one responsibility only.

##### 5. Data layer (Data access layer)
    * source
        * locals (Database)
        * remotes (API)
    * Repositories (Implementation from Domain layer)

##### 6. Models 
    * hive_adapters

##### 7. More insight of layers
![image](https://miro.medium.com/max/772/0*sfCDEb571WD-7EfP.jpg)

### DI pattern
`Dependency Injection` is a great design pattern that allows us to eliminate rigid dependencies between elements and it makes the application more flexible, easy to expand scales and maintain.
In the project we use Plugin `get_it` to implement DI and we have also defined classes so you can easily implement `DI` in the `DI layer`.

### Routes
The project has predefined Named routes

##### Build App
Every build must pass `--dart-define-from-file=env.json` — see
[Environment configuration](#environment-configuration) below.

> On a release build, omitting it does **not** fail. Assertions are stripped, so
> the build succeeds and produces a signed artifact with an empty API host and
> key that only fails once installed.

This project defines **no product flavors**, so do not pass `--flavor`.

for Android

```
## APK (sideload / manual testing)
flutter build apk --dart-define-from-file=env.json

## App Bundle (Play Store upload)
flutter build appbundle --dart-define-from-file=env.json
```

for IOS

```
## build only
flutter build ios --dart-define-from-file=env.json

## signed archive for App Store Connect
flutter build ipa --dart-define-from-file=env.json
```

### resources
      * All resources (images, fonts, videos, ...) must be placed in the assets class

### Environment configuration

`API_HOST` and `API_KEY` are supplied at build time via `--dart-define-from-file`,
so they are read with `String.fromEnvironment` and never committed.

1. Copy the template and fill in the real values:

```
cp env.example.json env.json
```

`env.json` is gitignored. `API_KEY` must match the shared secret the API expects
on `/graphql`; without it every request comes back 401.

2. Pass the file on every run/build:

```
flutter run --dart-define-from-file=env.json

flutter build apk --dart-define-from-file=env.json
flutter build ios --dart-define-from-file=env.json
```

The checked-in VS Code launch configurations already pass this flag. In
Android Studio / IntelliJ, the flag lives in the run configuration's
**Additional run args**.

> Omitting the flag leaves both values empty. In debug an assertion in
> `setupExternals` catches it; in release builds assertions are stripped, so the
> app ships with an empty host and key and fails at runtime instead.

### Getting started
Get dependencies and generate necessary files.

We'll handle the generation of required files for 🚀 your onboarding!


### Localization
Using this library to handle multi-languages. Follow this guide to understand and config languages files


-------

You've done entire steps correctly and I make sure that this project will have paramount effect on your progress learning `Flutter`
