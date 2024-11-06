//
//  Goal.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//

public enum Goal: Decodable, Sendable {
    case polyanet
    case space
    case cometh(direction: Direction)
    case soloon(color: Color)
    
    public enum Direction: String, Codable, Sendable {
        case right
        case left
        case up
        case down
    }
    
    public enum Color: String, Codable, Sendable {
        case blue
        case red
        case white
        case purple
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        
        switch value {
        case "SPACE":
            self = .space
        case "POLYANET":
            self = .polyanet
        case "RIGHT_COMETH":
            self = .cometh(direction: .right)
        case "LEFT_COMETH":
            self = .cometh(direction: .left)
        case "UP_COMETH":
            self = .cometh(direction: .up)
        case "DOWN_COMETH":
            self = .cometh(direction: .down)
        case "BLUE_SOLOON":
            self = .soloon(color: .blue)
        case "RED_SOLOON":
            self = .soloon(color: .red)
        case "WHITE_SOLOON":
            self = .soloon(color: .white)
        case "PURPLE_SOLOON":
            self = .soloon(color: .purple)
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid value: \(value)")
        }
    }

}

extension Goal.Direction {
    func map() -> ComethRequest.Direction {
        return switch self {
        case .right: .right
        case .left: .left
        case .up: .up
        case .down: .down
        }
    }
}

extension Goal.Color {
    func map() -> SoloonRequest.Color {
        return switch self {
        case .blue: .blue
        case .red: .red
        case .white: .white
        case .purple: .purple
        }
    }
}
