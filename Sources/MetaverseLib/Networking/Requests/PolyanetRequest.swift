//
//  PolyanetRequest.swift
//
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

struct PolyanetRequest: Encodable {
    let row: Int
    let column: Int
    let candidateId: String
    
    init(row: Int, column: Int, candidateId: String = Constants.candidateId) {
        self.row = row
        self.column = column
        self.candidateId = candidateId
    }
}


