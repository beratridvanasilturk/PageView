//
//  ViewController.swift
//  Page View
//
//  Created by Berat Rıdvan Asiltürk on 4.07.2023.
//

import UIKit

class ViewController: UIPageViewController {
    
    // MARK: Variables
    
    // var'a " = " diyip curly bracket actigimiz zaman bizden bir sey dondurmeyi bekleyecektir bu yuzden laz var'i return etmemiz gerekti.
    // Ayni sekilde " = " + curly bracket'larin sonuna " () " eklememiz gerekir.
    lazy var vcList: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyboard.instantiateViewController(identifier: "firstVC")
        let secondVC = storyboard.instantiateViewController(identifier: "secondVC")
        
        return [firstVC, secondVC]
    }()
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
    }
    
    private func setInitViews(){
        self.dataSource = self
        
        if let vc = vcList.first {
            self.setViewControllers([vc], direction: .forward, animated: true)
        }
    }
}

extension ViewController: UIPageViewControllerDataSource {
    
    // Geri pagination icin kullanilir
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = index - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard previousIndex < vcList.count else {
            return nil
        }
        
        return vcList[previousIndex]
        
    }
    
    // Ileri pagination icin kullanilir
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcList.lastIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = index + 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard previousIndex < vcList.count else {
            return nil
        }
        
        return vcList[previousIndex]
    }
}

