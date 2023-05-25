## README

This README file provides an overview of the code and its usage. It explains the purpose of the code and provides instructions for installation and configuration. It also includes information about the file structure and key components of the code.

### Project Description
This code is a Flutter application that displays the updated prices of coins and currencies. It retrieves the data from an API and presents it in a user-friendly interface. The code utilizes various Flutter widgets and libraries to create the UI and handle HTTP requests.

### Installation
To run this code locally, follow these steps:
1. Clone the repository or download the code files.
2. Open the project in your preferred Flutter development environment.
3. Install the necessary dependencies by running the following command:
   ```
   flutter pub get
   ```
4. Connect a device or start an emulator.
5. Run the application using the following command:
   ```
   flutter run
   ```

### Usage
Once the application is running, it will fetch data from the provided API and display the updated prices of coins and currencies. The UI consists of a list view showing the name, price, and change of each currency. The data is refreshed periodically, and users can manually refresh the data by tapping the "بروزرسانی" button.

### File Structure
The code files are organized as follows:
- `main.dart`: Contains the main entry point of the application and sets up the Flutter environment.
- `currency.dart`: Defines the `Currency` model class.
- `home.dart`: Implements the `Home` widget, which serves as the main screen of the application.
- `ad.dart`: Defines the `AD` widget for displaying advertisements.
- `my_item.dart`: Implements the `MyItem` widget, which represents an item in the currency list.
- `utils.dart`: Includes utility functions for formatting numbers and displaying SnackBars.

### Dependencies
The code relies on the following dependencies:
- `flutter_localizations`: Provides localization support for the application.
- `http`: Handles HTTP requests to fetch data from the API.
- `intl`: Formats the last updated time in a specific format.

### Contributing
Contributions to this project are welcome. If you encounter any issues or have suggestions for improvements, please submit a bug report or create a pull request.

### License
This code is released under the [MIT License](LICENSE).

### Acknowledgments
The code was developed with the help of various Flutter resources and libraries. Special thanks to the Flutter community for their support and contributions.