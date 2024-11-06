//
//  ComethRequest.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

struct ComethRequest: Encodable {
    public enum Direction: String, Codable {
        case up, down, left, right
    }
    
    let row: Int
    let column: Int
    let direction: Direction
    let candidateId: String
    
    init(row: Int, column: Int, direction: Direction, candidateId: String = Constants.candidateId) {
        self.row = row
        self.column = column
        self.direction = direction
        self.candidateId = candidateId
    }
}
