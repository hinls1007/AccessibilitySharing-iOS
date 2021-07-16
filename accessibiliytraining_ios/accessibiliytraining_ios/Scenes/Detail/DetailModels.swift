//
//  DetailModels.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Detail
{
    enum SetupView {
        struct Request {
        }
        struct Response {
            let detail: ListDetailModel?
        }
        struct ViewModel {
            let title: String
            let backButtonAccessibilityLabel: String
            let sections: [DetailRow]
        }
    }

    enum DetailRow {
        case largeImage(LargeImageCellViewConfig)
        case tooltips(TooltipsCellViewConfig)
        case divider(DividerCellViewConfig)
        case sectionSeparator
        case imageList(ImageContentCellViewConfig)
    }
}
