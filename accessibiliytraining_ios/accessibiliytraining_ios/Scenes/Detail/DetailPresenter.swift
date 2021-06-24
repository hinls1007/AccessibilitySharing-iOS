//
//  DetailPresenter.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailPresentationLogic {
    func presentSetupView(response: Detail.SetupView.Response)
}

class DetailPresenter: DetailPresentationLogic
{
    weak var viewController: DetailDisplayLogic?
    
    func presentSetupView(response: Detail.SetupView.Response) {
        if let detail = response.detail {
            var sections: [Detail.DetailRow] = [
                .largeImage(LargeImageCellViewConfig(image: UIImage(named: "bacteria"))),
                .tooltips(TooltipsCellViewConfig(
                    title: detail.title,
                    amount:detail.amount,
                    date: detail.date
                )),
                .divider(DividerCellViewConfig(
                    title: detail.item1,
                    description: detail.item2,
                    titleTwo: detail.item3,
                    descriptionTwo: detail.item4
                )),
                .sectionSeparator,
            ]

            sections.append(contentsOf: generateImagelist(images: detail.images))

            let viewModel = Detail.SetupView.ViewModel(title: "detail_page_title".localized,
                                                       sections: sections)
            viewController?.displaySetupView(viewModel: viewModel)
        }
    }

    private func generateImagelist(images: [ListImageModel]) ->  [Detail.DetailRow] {

        var sections: [Detail.DetailRow] = []
        images.forEach {
            sections.append(.imageList(ImageContentCellViewConfig(
                                        image: UIImage(named: "bacteria"),
                                        title: $0.title,
                                        description: $0.date)))
        }

        return sections
    }
}

