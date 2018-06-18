//
//  ViewController.swift
//  myComic
//
//  Created by Jorge Zevallos on 6/17/18.
//  Copyright © 2018 Jorge Zevallos. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var listComic = [Comic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://localhost:3000/comic")
        Alamofire.request(url!).responseJSON{ (response) in
            let result = response.data
            print(response.result)
            do{
                self.listComic = try JSONDecoder().decode([Comic].self, from: result!)
                for comic in self.listComic{
                    print(comic.name)
                }
            }catch{
                print("Error info: \(error)")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

