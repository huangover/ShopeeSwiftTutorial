//
//  ViewModel.swift
//  ShopeeSwiftTutorial
//
//  Created by Sihang Huang on 8/18/19.
//  Copyright © 2019 Sihang Huang. All rights reserved.
//

import Foundation

class ViewModel {
    
    var amount: Int?
    var fee: Int?
    
    var total: Int {
        return (amount ?? 0) + (fee ?? 0)
    }
    
    var channels: [ChannelModel] = []
    
    func fetchData() {
        if let response = try? JSONSerialization.jsonObject(with: channelResponse, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any],
            let serverChannels = response["channels"] as? [[String: Any]] {
         
            for serverChannel in serverChannels {
                let model = ChannelModel()
                model.name = serverChannel["name"] as? String
                model.branch = serverChannel["branch"] as? String
                model.channelID = serverChannel["channelID"] as? Int
                model.maxAmount = serverChannel["maxAmount"] as? Int
                channels.append(model)
            }
            
            // 用map函数
//            channels = serverChannels.compactMap { (channel: [String : Any]) -> ChannelModel? in
//                let model = ChannelModel()
//                model.name = channel["name"] as? String
//                model.branch = channel["branch"] as? String
//                model.channelID = channel["channelID"] as? Int
//                model.maxAmount = channel["maxAmount"] as? Int
//
//                return model
//            }
            
            
            // 一定要有channelID和name
            channels = channels.filter({$0.channelID != nil && $0.name != nil})
            
            // 结合compactMap和filter
//            channels = serverChannels.compactMap({ (channel: [String : Any]) -> ChannelModel? in
//                let model = ChannelModel()
//                model.name = channel["name"] as? String
//                model.branch = channel["branch"] as? String
//                model.channelID = channel["channelID"] as? Int
//                model.maxAmount = channel["maxAmount"] as? Int
//
//                return model
//            }).filter({$0.channelID != nil && $0.name != nil})
        }
    }
}
