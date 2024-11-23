//
//  PurposeEntity.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/24/24.
//

import Foundation

struct PurposeEntity: Entity {
    let title: String
    let details: String
    let number: Int
    let isValid: Bool
    let first: Bool
    let randomNum: Int
    let createdAt: Date
    
    init(title: String, details: String, number: Int, isValid: Bool, first: Bool = true, createdAt: Date) {
        self.title = title
        self.details = details
        self.number = number
        self.isValid = isValid
        self.first = first
        self.randomNum = Int.random(in: 1...4)
        self.createdAt = createdAt
    }
}

/*
"challengeList": [
    {
      "createdAt": "2024-11-23T18:43:35.339Z",
      "modifiedAt": "2024-11-23T18:43:35.339Z",
      "id": 0,
      "number": 0,
      "title": "string",
      "details": "string",
      "status": "FAIL",
      "memberChallenge": [
        {
          "createdAt": "2024-11-23T18:43:35.339Z",
          "modifiedAt": "2024-11-23T18:43:35.339Z",
          "id": 0,
          "member": {
            "createdAt": "2024-11-23T18:43:35.339Z",
            "modifiedAt": "2024-11-23T18:43:35.339Z",
            "id": 0,
            "name": "string",
            "username": "string",
            "password": "string",
            "email": "string",
            "isVerified": true,
            "memberChallenge": [
              "string"
            ]
          },
          "challenge": "string",
          "title": "string",
          "details": "string",
          "status": "FAIL"
        }
      ]
*/
