//
//  NetworkManager.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 05/08/23.
//

import Foundation

class MainModel {
    func getDataForMainScreen(completion: @escaping(MainDataModel?) -> Void) {
        //TODO: Real URL Request
        getLocalJsonFile { response in

            completion(response)
        }
    }

    private func getLocalJsonFile(completion: @escaping(MainDataModel?) -> Void) {
        let decoder = JSONDecoder()

        guard   let url = Bundle.main.url(forResource: "inicio", withExtension: "json"),
                let data = try? Data(contentsOf: url),
                let mainDataModel = try? decoder.decode(MainDataModel.self, from: data)
        else {
            completion(nil)
            return
        }

           completion(mainDataModel)
    }
}
