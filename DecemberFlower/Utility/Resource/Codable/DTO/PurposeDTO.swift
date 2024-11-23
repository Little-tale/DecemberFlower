//
//  PurposeDTO.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/24/24.
//

import Foundation

struct PurposeDTO: DTO {
    let title: String
    let details: String
    let number: Int
    let status: String
    let createdAt: String
}

struct PurposeDataDTO: DTO {
    let data: PurposeList
}

struct PurposeList: DTO {
    let challengeList: [PurposeDTO]
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
