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

    func create(request: Request) throws -> ResponseRepresentable {
        guard let name = request.data["name"]?.string else {
            throw Abort.badRequest
        }

        var task = Task(name: name)
        try task.save()

        return task
    }

    func makeResource() -> Resource<Task> {
        return Resource(
            index: index,
            store: create
        )
    }
}
