//
//  TooltipRouter.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TooltipRoutingLogic {}

protocol TooltipDataPassing {
    var dataStore: TooltipDataStore? { get }
}

class TooltipRouter: TooltipRoutingLogic, TooltipDataPassing {
    weak var viewController: TooltipViewController?
    var dataStore: TooltipDataStore?
}
