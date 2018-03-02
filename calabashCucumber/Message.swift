//
//  Message.swift
//  calabashCucumber
//
//  Created by Ilan B on 02/03/2018.
//  Copyright © 2018 Ilan B. All rights reserved.
//

import Foundation
import SwiftMessages

struct Message {
    static func showError(error: String) {
        var config = SwiftMessages.Config()
        config.duration = .seconds(seconds: 3)
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        let view = MessageView.viewFromNib(layout: .messageViewIOS8)

        // Theme message elements with the warning style.
        view.configureTheme(.error, iconStyle: .subtle)
        view.configureContent(title: "Erreur", body: error)
        // Show the message.
        SwiftMessages.show(config: config, view: view)
    }
}
