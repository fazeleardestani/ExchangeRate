#ExchangeRate

ExchangeRate is a Flutter application that provides up-to-date currency exchange rates. It fetches data from an API and displays the exchange rates in a user-friendly interface.

## Features

- Displays the exchange rates for different currencies.
- Updates the exchange rates periodically.
- Supports Farsi language.

## Prerequisites

Before running the application, make sure you have the following:

- Flutter SDK installed on your machine.
- An Android or iOS device or emulator to run the application.

## Getting Started

To run the Arz App on your local machine, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/ExchangeRate.git`
2. Navigate to the project directory: `cd ExchangeRate`
3. Install the dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Dependencies

The Arz App uses the following dependencies:

- `http`: For making HTTP requests to fetch data from the API.
- `intl`: For formatting date and time.
- `flutter_localizations`: For supporting localization and internationalization.
- `cupertino_icons`: For using Cupertino icons in the app.

You can find the complete list of dependencies in the `pubspec.yaml` file.

## Usage

When you launch the Arz App, it fetches the latest currency exchange rates from an API and displays them in a list. The exchange rates include the currency name, price, and changes.

You can refresh the exchange rates by tapping the "Refresh" button at the bottom of the screen. The app will fetch the latest data from the API and update the list accordingly.

The app also supports Farsi language. It automatically detects the device's language settings and displays the app in Farsi if available.

## Contributing

Contributions to the Arz App are welcome! If you find a bug or want to add a new feature, please submit an issue or a pull request.

## License

The Arz App is released under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as per the terms of the license.
