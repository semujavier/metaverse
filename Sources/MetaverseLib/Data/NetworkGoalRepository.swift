//
//  NetworkGoalRepository.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

final class NetworkGoalRepository: GoalFetcher {
    let apiClient: APIClient = APIClient()
    
    func getGoal(candidateId: String) async throws -> MetaverseGoal {
        let goalResponse: GoalResponse = try await apiClient.requestDecodable(.goal(candidateId))
        return goalResponse.goal
    }
}
