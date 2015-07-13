# API samples #

Here are some sample web apps built in Dart using the Google APIs. You can see them in action by clicking on the **View demo** links below.

To check out and compile these yourself, get a copy of the samples with
```
git clone https://code.google.com/p/google-api-dart-client.samples/
```

Each sample has its own directory (e.g. `roulette/`). For any sample, install the dependencies with
```
cd roulette
pub install
```

and then compile it with
```
dart2js --out=roulette.dart.js roulette.dart
```

## Rickroll Roulette (urlshortener-v1) ##

Abbreviates a URL you specify, or rickrolls you instead.

[Browse code](https://code.google.com/p/google-api-dart-client/source/browse/roulette/roulette.dart?repo=samples) | [View demo](http://samples.google-api-dart-client.googlecode.com/git/roulette/index.html)

## Today's schedule (calendar-v3) ##

Shows your schedule for today.

This sample authenticates with OAuth2 to access the user's calendars.

[Browse code](https://code.google.com/p/google-api-dart-client/source/browse/schedule/schedule.dart?repo=samples)  | [View demo](http://samples.google-api-dart-client.googlecode.com/git/schedule/index.html)