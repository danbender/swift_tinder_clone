//
//  ViewController.swift
//  SwiftTinderClone
//
//  Created by Dan Bender on 28/12/15.
//  Copyright (c) 2015 Dan Bender. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let cardsVC: UIViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CardsNavController") as! UIViewController
    let profileVC: UIViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProfileNavController") as! UIViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor()
        dataSource = self
        self.setViewControllers([cardsVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    MARK: UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        return nil
    }

}

