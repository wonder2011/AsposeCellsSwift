//
//  ViewController.swift
//  AsposeCellsSwift
//
//  Created by wonder2011 on 11/12/2022.
//  Copyright (c) 2022 wonder2011. All rights reserved.
//

import UIKit
import AsposeCellsSwift

class ViewController: UIViewController {

    let clientId = "fc3d9b24-3513-4607-9ba4-b807231cc019"
    let clientSecret = "cafec20eae1dd7f28a52da033996bc4c"

    let storageName = "Lionex iOS App"
    let fileName = "test.xlsx"
    let worksheetName = "Start"

    var asposeCellWrapper: AsposeCellsSwift!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.asposeCellWrapper = AsposeCellsSwift(clientId: self.clientId, clientSecret: self.clientSecret)

        self.usageExample()
    }

    /*
     Some usage examples of this class
     */
    func usageExample() {

        Task {
            do {
                let _ = try await self.asposeCellWrapper.authorizeClient()
            } catch(let error) {
                print(error)
            }
        }
    }

}

extension ViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

