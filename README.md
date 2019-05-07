<p align="center"><a href="https://github.com/darekaze/canorous" rel="noopener noreferrer"><img src="assets/brand/horizontal.svg" alt="Canorous" width="400"/></a></p>

<p align="center">Listen & Share Awesome Audio Streams with Friends</p>

<p align="center">
  <!-- Coverage or quality info to be added -->
  <a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat-square" alt="License"></a>
  <a href=".github/CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PR welcome"></a>
</p>

<!-- Screenshots to be added -->

## What is Canorous?

*Canorous* (`/kəˈnɔːrəs/`, meaning *pleasant sounding*) is a free modern native app for Listening and Sharing awesome audio streams with friends.

It is made with Flutter :sparkling_heart:, following the incredible [BLoC](https://felangel.github.io/bloc/#/architecture) pattern (using the [bloc library](https://felangel.github.io/bloc/#/)).

If you appreciate this app, support this project visibility by giving 👍/⭐

### Features

- [x] Search YT (with Invidious)
- [x] Audio-only streaming
- [x] Automatic cache management
- [x] Custom playlists
- [x] Recently played list
- [x] Moment (post-sharing service)
- [x] Used only Internet Permission
- [x] Background playback (only in Android)

Upcoming...

- [ ] Better play control & playlist
- [ ] General Music Features (e.g. Shuffle)
- [ ] Notification Control
- [ ] Background playback (iOS)
- [ ] Import/Export Playlist

## Building

Follow the [Flutter Official Guide](https://flutter.dev/docs/get-started/install) to install Flutter & Android Studio, together with the Flutter Plugin.

Ensure that the installation is successful by running:
```bash
$ flutter doctor
```

Then, clone the repository from GitHub:
```bash
$ git clone https://github.com/darekaze/canorous.git
```

Open the directory using a terminal:
```bash
$ cd canorous
```

Get the packages from pub:
```bash
$ flutter packages get
```

Build the apk package by running:
```bash
$ flutter build apk --flavor production -t lib/main.dart
```

or install the app in iOS by running (non-permanent method):
```bash
$ flutter run --release --flavor production -t lib/main.dart
```

## Contributing

Our main goal is to make the app faster and easier to use. Read below to learn how you can take part in improving Canorous.

### [Code of Conduct](.github/CODE_OF_CONDUCT.md)

Canorous adopted a Code of Conduct that we expect project participants to adhere to. Please read the full text so that you can understand what actions will and will not be tolerated.

### [Contribution Guide](.github/CONTRIBUTING.md).

Read our [contributing guide](.github/CONTRIBUTING.md) to learn about our development process, how to propose bugfixes and improvements.

## Packages & Services used

- [Invidious](https://github.com/omarroth/invidious) - Used in Searching YT video
- [Youtube Extractor](https://pub.dev/packages/youtube_extractor) - Obtaining the audio link from YT, magically
- [audioplayers](https://pub.dev/packages/audioplayers) - Audio player plugins for both Android & iOS
- [Flutter bloc](https://pub.dev/packages/flutter_bloc) - For implementing the BLoC pattern with ease
- [sembast](https://pub.dev/packages/sembast) - NoSQL persistent store database

### Other dependencies

- [fluro](https://pub.dev/packages/fluro)
- [dio](https://pub.dev/packages/dio)
- [rxdart](https://pub.dev/packages/rxdart)
- [flutter_hooks](https://pub.dev/packages/flutter_hooks)
- [cached_network_image](https://pub.dev/packages/cache_network_image)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
- [shimmer](https://pub.dev/packages/shimmer)
- [timeago](https://pub.dev/packages/timeago)
- [share](https://pub.dev/packages/share)
- [marquee](https://pub.dev/packages/marquee)

## License

[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)

Canorous is Free Software: You can use, study share and improve it at your will. Specifically you can redistribute and/or modify it under the terms of the [GNU General Public License](https://www.gnu.org/licenses/gpl.html) as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
