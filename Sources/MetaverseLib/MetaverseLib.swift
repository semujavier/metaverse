
public enum Constants {
    public static let candidateId = "1e79a673-b581-4c0a-b4e8-a004db123e1f"
}

public actor Metaverse {
    public static let shared = Metaverse()
    private var candidateId: String = Constants.candidateId
    private var goalRepository: GoalFetcher = NetworkGoalRepository()
    private var processor: MetaverseProcessorProtocol = MetaverseProcessor()
    
    private init() { }

    public func buildMetaverse() async throws {
        Task {
            let goal = try await goalRepository.getGoal(candidateId: candidateId)            
            await processor.processMetaverseGoal(goal)
        }
    }
    
    public func setCandidateId(_ candidateId: String) {
        self.candidateId = candidateId
    }

    //Internal method to add dependecy injection for testing
    func setGoalRepository(_ repository: GoalFetcher) {
        self.goalRepository = repository
    }

    //Internal method to add dependecy injection for testing
    func setProcessor(_ processor: MetaverseProcessorProtocol) {
        self.processor = processor
    }

}
