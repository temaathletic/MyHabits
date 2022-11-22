//
//  Resuorce.swift
//  MyHabits
//
//  Created by temaathletic on 19.11.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#A116CC")
        static var inActive = UIColor(hexString: "#999999")
        
        static var tabBarBackground = UIColor(hexString: "#CCF7F7F7")
        static var viewBackground = UIColor(hexString: "#FFFFFF")
        
        static var navBarText = UIColor(hexString: "#000000")
        
        static var separator = UIColor(hexString: "#E8ECEF")
    }
    
    enum Strings {
        enum TabBar {
            static var habit = "Привычки"
            static var info = "Информация"
        }
    }
    
    enum Images {
        enum TabBar {
            static var habit = UIImage(named: "habit_tab")
            static var info = UIImage(named: "info_tab")
        }
    }
    
    enum Fonts {
        static func sfProDisplay(with size: CGFloat) -> UIFont {
            UIFont(name: "SF Pro Display", size: size) ?? UIFont()
        }
    }
}
