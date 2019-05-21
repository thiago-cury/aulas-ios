//
//  Coordinator.swift
//  ExCoordinator
//
//  Created by Thiago  Espindola Cury on 20/05/2019.
//  Copyright © 2019 Thiago Cury. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

