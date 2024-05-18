# Google Map Search

[![Flutter Version](https://img.shields.io/badge/Flutter-v2.10.0-blue.svg)](https://flutter.dev/)
[![Google Maps API](https://img.shields.io/badge/Google%20Maps%20API-v3-green.svg)](https://developers.google.com/maps/documentation)

This Flutter application demonstrates the integration of Google Maps and Google Places API to create a map-based application with search functionality.


<img width="1133" alt="Screenshot 2024-05-18 at 2 05 28 PM" src="https://github.com/arthikrishh/Google-Map-with-Search/assets/116914004/207ded0a-2464-4185-97a6-5d881903d933">


## Overview

This application allows users to:
- View a map with predefined initial location and zoom level.
- Search for places using the Google Places API.
- View details of selected places including name, address, and location on the map.

## Features

- **Map Screen**: Displays the Google Map with predefined initial location and zoom level.
- **Search Functionality**: Users can search for places using the search bar and the Google Places API.
- **Place Details**: Selected places are displayed on the map with markers, and their details are shown in info windows.

## Getting Started

To run this application locally, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Ensure Flutter is installed and set up on your machine.
4. Obtain API keys for Google Maps and Google Places APIs.
5. Add your API keys to the project as described in the [Configuration](#configuration) section.
6. Run the application using `flutter run` command.

## Configuration

Before running the application, you need to obtain API keys for Google Maps and Google Places APIs and add them to the project.

1. **Google Maps API Key**:
   - Go to the [Google Cloud Console](https://console.cloud.google.com/).
   - Enable the Maps SDK for Android and iOS and Places API.
   - Generate an API key.
   - Add the API key to the `android/app/src/main/AndroidManifest.xml` file for Android and `Info.plist` file for iOS.
   
2. **Google Places API Key**:
   - Follow the same steps as above and enable the Places API.
   - Add the API key to the Flutter application code where it's required.


## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, feel free to open an issue or create a pull request.


## Acknowledgements

- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- [Flutter Google Places](https://pub.dev/packages/flutter_google_places_hoc081098)
- [Google Place API for Dart](https://pub.dev/packages/google_place)
- [Google Maps Web Services for Dart](https://pub.dev/packages/google_maps_webservice)
- [Google Fonts for Flutter](https://pub.dev/packages/google_fonts)


## OUTPUT VIDEO 

https://github.com/arthikrishh/Google-Map-with-Search/assets/116914004/a01438dc-2c9b-42fc-b23c-955170af8a0e



