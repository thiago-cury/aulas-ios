//
//  Storyboarded.swift
//  ExCoordinator
//
//  Created by Thiago  Espindola Cury on 20/05/2019.
//  Copyright © 2019 Thiago Cury. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
