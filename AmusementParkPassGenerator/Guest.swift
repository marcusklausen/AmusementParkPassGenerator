//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Marcus Klausen on 14/05/2017.
//  Copyright © 2017 Marcus Klausen. All rights reserved.
//

import Foundation

enum GuestType {
    case classic
    case vip
    case freeChild
}

class Guest: GuestEntrant {
    
    var type: GuestType
    var profile: Profile?
    
    init(as type: GuestType, withInformation profile: Profile) {
        self.type = type
        self.profile = profile
    }
}

extension Guest {
    var areaAccess: [AreaAccess] {
        var areaAccess: [AreaAccess]
        
        switch type {
        case .classic,
             .vip,
             .freeChild:              areaAccess = [.amusement]
        }
        return areaAccess
    }
    
    var discountAcces: [DiscountAccess]? {
        var discountAccess: [DiscountAccess]?
        switch type {
        case .classic,
             .freeChild:               discountAccess = nil
        case .vip:                     discountAccess = [.discountOnFood(.ten), .discountOnMerchandise(.twentyFive)]
        }
        return discountAccess
    }
    
    var rideAccess: [RideAccess] {
        var rides: [RideAccess]
        
        switch type {
        case    .classic,
                .freeChild:         rides = [.accessAllRides]
        case    .vip:               rides = [.accessAllRides, .skipAllLines]
        }
        return rides
    }
    
    
}
