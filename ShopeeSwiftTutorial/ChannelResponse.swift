//
//  BankDATA.swift
//  ShopeeSwiftTutorial
//
//  Created by Sihang Huang on 8/18/19.
//  Copyright © 2019 Sihang Huang. All rights reserved.
//

import Foundation

let channelResponse: Data = """
{
    "code": "200",
    "totalCount": "10",
    "channels": [
        {
        "name": "bank 1",
        "channelID": 1,
        "branch": "GuangDong"
        "maxAmount": 10000,
        "fee": 50
        },
        {
        "name": "bank 2",
        "channelID": 2,
        "branch": "FuJian"
        "maxAmount": 15000,
        "fee": 20
        },
        {
        "name": "bank 1",
        "channelID": null,
        "branch": "GuangDong"
        "maxAmount": 20000,
        "fee": 60
        },
        {
        "name": null,
        "channelID": 1,
        "branch": "BeiJing"
        "maxAmount": 50000,
        "fee": 10
        }
    ]
}
""".data(using: .utf8)!
