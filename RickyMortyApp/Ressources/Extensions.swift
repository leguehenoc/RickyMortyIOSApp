//
//  Extensions.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 22/08/2025.
//

import UIKit

extension UIView{
    func addSubviews(_ view:UIView...){
        view.forEach{
            addSubview($0)
        }
    }
}
