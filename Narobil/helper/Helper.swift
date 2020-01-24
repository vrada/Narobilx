//
//  Helper.swift
//  Narobil
//
//  Created by Dharmendria on 20/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import Foundation

func delay(durationInSeconds seconds: Double, completion: @escaping () -> Void)
{
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
