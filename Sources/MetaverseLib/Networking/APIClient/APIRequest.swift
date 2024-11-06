//
//  APIRequest.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//
import Foundation

enum APIRequest {
    case goal(String), postPolyanet(PolyanetRequest), postCometh(ComethRequest), postSoloon(SoloonRequest)
    
    var baseURL: URL { .init(string: "https://challenge.crossmint.io/api/")! }
    
    var id: String {
        switch self {
        case .goal: "Goal"
        case .postPolyanet: "Post Polyanet"
        case .postCometh: "Post Cometh"
        case .postSoloon: "Post Soloon"
        }
    }
    
    var endpoint: String {
        switch self {
        case .goal(let candidateId): "map/\(candidateId)/goal"
        case .postPolyanet: "polyanets"
        case .postCometh: "comeths"
        case .postSoloon: "soloons"
        }
    }

    var method: Method {
        switch self {
        case .goal: .get
        case .postPolyanet, .postSoloon, .postCometh: .post
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .goal: nil
        case .postPolyanet, .postSoloon, .postCometh: ["Content-Type": "application/json"]
        }
    }
    
    var body: Data? {
        switch self {
        case .goal:
            nil
        case .postPolyanet(let request):
            try? JSONEncoder().encode(request)
        case .postCometh(let request):
            try? JSONEncoder().encode(request)
        case .postSoloon(let request):
            try? JSONEncoder().encode(request)
        }
    }
    
}
