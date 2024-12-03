//
//  CalendarManaging.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

import EventKit

protocol CalendarManaging {
    func create(eventModel: WishEventModel) -> Bool
}
