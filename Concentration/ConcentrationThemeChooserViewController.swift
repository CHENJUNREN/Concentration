//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Chenjun Ren on 2021-06-07.
//

import UIKit

class ConcentrationThemeChooserViewController: VCLLoggingViewController {

    override var vclLoggingName: String {
        return "ThemeChooser"
    }
    
    let themes = [
        "Sports": "β½οΈππβΎοΈπΎπππ±πβ·π³β³οΈ",
        "Animals": "πΆπ¦πΉπΈππ¦ππ©π¦π¦ππ",
        "Faces": "ππππ€π π€π­π°π±π³ππ"
    ]
    
    @IBAction func chooseTheme(_ sender: Any) {
//        if let cvc = splitViewDetailConcentrationViewController {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                cvc.theme = theme
//            }
//        } else if let cvc = lastSeguedToConcentrationViewController {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                cvc.theme = theme
//            }
//            navigationController?.pushViewController(cvc, animated: true)
//        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
//        }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        if let navigation = splitViewController?.viewControllers.last as? UINavigationController {
            return navigation.viewControllers.last as? ConcentrationViewController
        }
        return nil
    }
    
    
    // MARK: - Navigation
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
    }
}
