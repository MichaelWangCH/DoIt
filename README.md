# DoIt
 A simple to-do list app using [Vapor](https://vapor.codes/) web server.

### Project Setup

#### Server

1. Install Xcode 8.2 or above.
2. Install [Vapor Toolbox](https://vapor.github.io/documentation/getting-started/install-toolbox.html) or just run `brew install vapor/tap/toolbox` if you have Homebrew.
3. Install [PostgreSQL](https://www.postgresql.org/) or just run `brew install postgresql` if you have Homebrew. Run the [PostgreSQL script](https://github.com/MichaelWangCH/DoIt/blob/master/DoIt-Server/postgresql) in the root directory to set up the database.
4. Go to directory `DoIt-Server` and build the server by running `vapor build`.
5. Start the server by running `vapor run` or you can open the project in Xcode and choose the "App" target and run from Xcode. Once the app is running, open a browser and go to [http://localhost:8080](http://localhost:8080).

#### App

open DoIt.xcodeproj in DoIt-iOS using Xcode and run the app.
