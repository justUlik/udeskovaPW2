//
//  WishCalendarViewModel.swift
//  udeskovaPW2
//
//  Created by Ulyana Eskova on 02.12.2024.
//

class WishCalendarViewModel {
    private(set) var events: [WishEventModel] = []
    
    func addEvent(_ event: WishEventModel) {
        events.append(event)
    }
    
    func getEventCount() -> Int {
        return events.count
    }
    
    func getEvent(at index: Int) -> WishEventModel {
        return events[index]
    }
    
    func shouldShowNoEventsLabel() -> Bool {
        return events.isEmpty
    }
}
