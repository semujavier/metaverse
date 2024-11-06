//
//  SoloonRequest.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//


struct SoloonRequest: Encodable {
    
    public enum Color: String, Codable {
        case blue, red, purple, white
    }
    
    let row: Int
    let column: Int
    let color: Color
    let candidateId: String
    
    init(row: Int, column: Int, color: Color, candidateId: String = Constants.candidateId) {
        self.row = row
        self.column = column
        self.color = color
        self.candidateId = candidateId
    }
}
