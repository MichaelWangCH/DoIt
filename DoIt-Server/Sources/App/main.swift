import Vapor
import VaporPostgreSQL

let drop = Droplet()

// Vapor runs migrations/preparations for models
drop.preparations.append(Task.self)

do {
    // add VaporPostgreSQL provider, this will bind the data to the database and the models automatically down the line.
    try drop.addProvider(VaporPostgreSQL.Provider.self)
} catch {
    assertionFailure("Error adding provider: \(error)")
}

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("tasks", TaskController())

drop.run()
