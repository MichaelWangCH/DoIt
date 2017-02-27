//
//  TaskController.swift
//  DoItServer
//
//  Created by Wang, Michael on 27/02/2017.
//
//
import Vapor
import HTTP

class TaskController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try Task.all().makeNode().converted(to: JSON.self)
    }

    func makeResource() -> Resource<Task> {
        return Resource(
            index: index
        )
    }
}
