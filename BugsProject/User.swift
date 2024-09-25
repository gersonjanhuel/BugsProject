//
//  User.swift
//  BugsProject
//
//  Created by Gerson Janhuel on 25/09/24.
//
import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var age: Int
    var email: String
}
