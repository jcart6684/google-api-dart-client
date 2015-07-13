# Getting the libraries #

Create a `pubspec.yaml` for your code:
```
name: 'my-awesome-app'
dependencies:
  google-api-dart-client:
    git: https://code.google.com/p/google-api-dart-client
```

Now type `pub install` to download the latest version into your `packages/` directory.

You can now import one of the [supported APIs](APIs.md) like this:
```
#import("package:google-api-dart-client/urlshortener-v1.dart");
```

# Making an API call #

The first thing you need is an API context:
```
final urlshortener = new UrlshortenerApi();
```
You need to set the API key, which you obtain from the [Google APIs console](https://code.google.com/apis/console/). (This isn't needed if you use OAuth)
```
urlshortener.key = "YOUR API KEY HERE";
```
We're going to shorten a URL using the `urlshortener.url.insert()` method, which takes a `Url` object as a parameter.
```
final original = new Url();
original.longUrl = "http://www.youtube.com/watch?v=oHg5SJYRHA0";
```
All API calls are asynchronous. Insert() returns a `Future<Url>`.
```
Future<Url> result = urlshortener.url.insert(original);
result.then((shortened) => print("Shortened URL is ${shortened.id}"));
```

# Using OAuth #

Many APIs will require an OAuth token to read user data. The token is associated with a set of **scopes**, which describe what permissions your application has.

For example, for read-only access to the user's calendar, you need the scope `https://www.googleapis.com/auth/calendar.readonly`.

You need to obtain an client ID from the [Google APIs console](https://code.google.com/apis/console/), and enable the APIs you want to use. You will need to set the authorized Javascript origin appropriately, such as `http://www.mysite.com`, or `http://localhost` (for development). It's not possible to use OAuth with an app running from local disk.

Then you can set up an authenticated API connection, like this:

```
#import("package:google-api-dart-client/oauth2.dart");
#import("package:google-api-dart-client/calendar-v3.dart");

final auth = new OAuth2(
    'YOUR CLIENT ID HERE',
    ['https://www.googleapis.com/auth/calendar.readonly'],
    tokenLoaded:oauthReady);
final cal = new CalendarApi(authenticator:auth);
```

Your `oauthReady` function will be called once your app has a valid OAuth token to call the APIs. If the user has authorized the app in the past, this will occur automatically. Otherwise, you need to call `oauth.login()` to trigger a confirmation dialog.

```
final loginButton = document.query('#loginButton');
loginButton.on.click.add((e) => oauth.login());
oauthReady(Token token) {
   // Hide the Login button...
   loginButton.style.display = 'none';
   // make some API calls...
}
```

Once oauthReady is called, any API calls you make will use the current OAuth2 token.