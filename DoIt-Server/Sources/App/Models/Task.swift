//
//  Task.swift
//  DoItServer
//
//  Created by Wang, Michael on 27/02/2017.
//
//

import Vapor
import Fluent
import Foundation

struct Task: Model {
    var id: Node?
    var name: String

    init(name: String) {
        self.id = nil
        self.name = name
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name
        ])
    }
}

extension Task: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}
