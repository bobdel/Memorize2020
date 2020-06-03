//
//  Array+Only.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 6/2/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

import Foundation

/// Return the element of a 1 item array
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
