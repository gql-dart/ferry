This example project contains of a GraphQL server that can be run locally and a Flutter app that uses
ferry to communicate with the server.

You need to start the server before you can run the flutter app.

See the respective READMEs in the client and server dir for more information.

The flutter app runs the ferry client in a separate isolate.
It also uses token authentication to demonstrate on how to communicate 
between the isolate and the main thread.