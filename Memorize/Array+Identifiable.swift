//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 6/2/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0 //bogus
    }
}
