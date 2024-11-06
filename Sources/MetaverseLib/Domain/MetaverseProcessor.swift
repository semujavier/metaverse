//
//  MetaverseProcessor.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

protocol MetaverseProcessorProtocol: Actor {
    func processMetaverseGoal(_ goal: MetaverseGoal) async
}

actor MetaverseProcessor: MetaverseProcessorProtocol {
    private let client: APIClient = APIClient()

    func processMetaverseGoal(_ goal: MetaverseGoal) async {
        print("Starting to fetch and process goal response...")

        await withTaskGroup(of: Void.self) { group in
            for (rowIndex, row) in goal.enumerated() {
                for (columnIndex, goal) in row.enumerated() {
                    try? await Task.sleep(for: .milliseconds(250))
                    group.addTask {
                        await self.processGoal(goal, atRow: rowIndex, column: columnIndex)
                    }
                }
            }
            print("Metaverse completed")
        }
    }

    private func processGoal(_ goal: Goal, atRow row: Int, column: Int) async {
        do {
            if let request = buildRequest(goal: goal, column: column, row: row) {
                print("Building \(goal) at (\(row), \(column))")
                _ = try await client.request(request)
                print("Successfully created \(goal) at (\(row), \(column))")
            }
        } catch {
            print("Error creating \(goal) at (\(row), \(column)): \(error)")
        }
    }
    
    private func buildRequest(goal: Goal, column: Int, row: Int) -> APIRequest? {
        switch goal {
        case .polyanet:
            return .postPolyanet(PolyanetRequest(row: row, column: column))
        case .cometh(direction: let direction):
            return .postCometh(ComethRequest(row: row, column: column, direction: direction.map()))
        case .soloon(color: let color):
            return .postSoloon(SoloonRequest(row: row, column: column, color: color.map()))
        case .space:
            return nil
        }
    }
}
