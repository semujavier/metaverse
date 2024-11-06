//
//  APIClientError.swift
//  MetaverseLib
//
//  Created by Javier Serrano Muñoz on 5/11/24.
//


public enum APIClientError: Error {
    case invalidResponse
    case noRetriesLeft
}