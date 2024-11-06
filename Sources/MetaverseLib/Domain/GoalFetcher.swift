//
//  GoalRepository.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

protocol GoalFetcher: Sendable {
    func getGoal(candidateId: String) async throws -> MetaverseGoal 
}
