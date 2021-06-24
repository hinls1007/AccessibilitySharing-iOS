//
//  TooltipModels.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Tooltip
{
    enum SetupView {
        struct Request {

        }
        struct Response {
            let title: String?
            let content: String?
        }
        struct ViewModel {
            let title: String?
            let content: String?
        }
    }
}
