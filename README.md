# photos_videos_pexels_api

## About

This application lets users see photos and videos (without audio) from pexels.com.

It uses the [photos videos API](https://www.pexels.com/). Documentation can be found [here](https://www.pexels.com/api/documentation/). To get started see the instructions [here](https://www.pexels.com/onboarding/). You will need to follow these instructions to obtain your unique API key.

It uses [Riverppd](https://riverpod.dev/) for state management.

A running implementation of the application can found [here](https://danielgenecasey.net/photos-videos-pexels-api/).

This application has been tested on Windows, Linux and the web.

## Instructions for adding your API key to the project

Create a file named ".env" at the project level.

Add your pexels.com API key to this file. The contents of the file should like this: `API_KEY = '<YOUR API KEY HERE>'`.

Then run the following command from the terminal `dart run build_runner build`.  This should create a file named `env.g.dart` file in the `lib/env` directory.

You might find this [web site](https://pub.dev/packages/envied) helpful.

## Running & Building

To run the application you can use the `flutter run` command specifying the device like so: `flutter run -d windows`.

To run and build the application in release mode you can enter a command such as this: `flutter run -d windows --release`.

To build the application in release mode you can enter a command such as this: `flutter build windows`.

## Using the Application

The user can select any of the six buttons ('Get Curated Photos', "Search Photos", "Get Popular Videos", "Search Vidoes", "Get Photo by ID", or "Get Video by ID).

To use the "Search Photos" or the "Search Videos" feature, the user must enter some search text (e.g. tigers, nature, ect.). 

To use the "Get Photo by ID" feature, the user must enter a photo ID (eg: 2014422).  To use the "Get Video by ID feature, the user must enter a video ID (eg. 2499611)

If the user wants to use the keyboard to scrool through the list of photos or videos (in addition to using the mouse), he or she can use the keyboard to scrool using the `<Page Down>` key or the `<Page Up>` key if using a desktop computer.
