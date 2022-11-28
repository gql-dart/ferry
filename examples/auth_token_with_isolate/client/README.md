# authors_example

A basic sample app to demonstrate how to use ferry in a separate isolate.
It features token authentication. The token is stored in the main isolate and saved via shared preferences, 
so it's still easy to check the authentication status in the main isolate.


## Getting Started

### Prerequisites

- Docker (in order to start the server)

### Running the server

- go the `../server` directory
- run `docker compose up --build`
- the server should be running on `http://localhost:3010/graphql`

### Running the app

It easier to run the app locally on the same machine as the server.
This means, running it on an iOS simulator or an Android emulator, or as a MacOS/Windows/Linux desktop app.

Web App won't work because isolates are not supported in the browser currently.

Run the app in the usual way, e.g. `flutter run`.

If you want to run the app on a separate physical device, you need to make sure that 
the device can connect to the server. 
Check your firewall settings, get the IP address of the server and pass  
`--dart-define=ENDPOINT=http://<your-ip>:<port>/graphql` to the flutter run command.


### Features

- create the ferry client in a separate isolate
- use the ferry client in the main isolate
- store the token in the main isolate and save it via shared preferences
- request the token from the ferry isolate and add it to the request via HTTP headers
- simple main page with a list of authors and a button to add a new authors
- adding authors is only possible if the user is authenticated (any credentials will do, just enter random text)
- the list of authors is updated automatically when a new author is added via updateCacheHandlers

### Not shown

- token refresh - this is already demonstrated in other examples, see HttpAuthLink in the gql repository: https://github.com/gql-dart/gql/tree/master/examples/gql_example_http_auth_link 
  The architecture shown here can also be used to implement token refresh in a very similar way.
  But pull requests are welcome if you want to add this feature to this example.

Note: because the local server servers http, not https, this example app sets 

```xml
        android:usesCleartextTraffic="true"
```
in the AndroidManifest.xml and
and 

```xml
<key>NSAppTransportSecurity</key>
<dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
</dict>
```
in the Info.plist.

Don't do this in production apps, it's only for demonstration purposes.
