# DoIt
 A simple to-do list app using [Vapor](https://vapor.codes/) web server.

### Project Setup

#### Server

1. Install Xcode 8.2 or above.
2. Install [Vapor](http://vapor.codes/) or just run `brew install vapor/tap/vapor` if you have Homebrew.
3. Install [PostgreSQL](https://www.postgresql.org/) or just run `brew install postgresql` if you have Homebrew. Run the [PostgreSQL script](https://github.com/MichaelWangCH/DoIt/blob/master/DoIt-Server/postgresql) in the root directory to set up the database.
4. Go to directory `DoIt-Server` and build the server by running `vapor build`.
5. Start the server by running `vapor run` or you can open the project in Xcode and choose the "App" target and run from Xcode. Once the app is running, open a browser and go to [http://localhost:8080](http://localhost:8080).

#### App

1. Install Carthage using Homebrew `brew install carthage`.
2. Run `carthage update`.
3. Open DoIt.xcodeproj in DoIt-iOS using Xcode and run the app.
