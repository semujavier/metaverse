//
//  GoalResponse.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

public typealias MetaverseGoal = [[Goal]]

struct GoalResponse: Decodable, Sendable {
    let goal: [[Goal]]
    
    func getItemAt(row: Int, column: Int) -> Goal? {
        return goal[row][column]
    }
}
