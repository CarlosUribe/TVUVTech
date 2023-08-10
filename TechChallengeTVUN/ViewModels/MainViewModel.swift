//
//  MainViewModel.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 05/08/23.
//

import Foundation
import Combine

class MainViewModel {
    let mainModel = MainModel()
    @Published var model: MainDataModel?

    var cancellable = Set<AnyCancellable>()
    
    func getMainData() {
        //TODO: Handle error states
        self.mainModel.getDataForMainScreen(completion: { response in
            self.model = response
        })
    }
    
}

