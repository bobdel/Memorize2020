//
//  Array+Only.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 6/2/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
