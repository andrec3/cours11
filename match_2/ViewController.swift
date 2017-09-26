//
//  ViewController.swift
//  match_2
//
//  Created by eleves on 17-09-20.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var back_1: UIView!
    @IBOutlet weak var front_1: UIView!
    @IBOutlet weak var back_2: UIView!
    @IBOutlet weak var front_2: UIView!
    @IBOutlet weak var back_3: UIView!
    @IBOutlet weak var front_3: UIView!
    @IBOutlet weak var back_4: UIView!
    @IBOutlet weak var front_4: UIView!
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    
    var arrayOfImagesViews: [UIImageView]!
    var arrayOfAnimalNames:  [String] = ["panda.png", "panda.png", "penguin.png", "penguin.png"]
    // Tableau vide
    var arrayOfRandomAnimalNames = [String] ()
    
    // ============================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfImagesViews = [imgView1, imgView2, imgView3, imgView4]
        
        randomAnimalNames()
        
        setImagesToCard()
        
    }


    
    // ============================
    
    
    @IBAction func showCard(_ sender: UIButton) {
        //print(sender.tag)
        switch sender.tag {
        case 0:
            flipCard(from: front_1, to: back_1)
        case 1:
            flipCard(from: front_2, to: back_2)
        case 2:
            flipCard(from: front_3, to: back_3)
        case 3:
            flipCard(from: front_4, to: back_4)
        default:
            break
        }
    }
    // ============================
    func flipCard(from: UIView, to: UIView){
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: from, duration: 1.0, options: transitionOptions, animations: {from.isHidden = true})
        
        UIView.transition(with: to, duration: 1.0, options: transitionOptions, animations: {to.isHidden = false})
    }
    // ============================
    func setImagesToCard(){
        var number = 0
        for imgView in arrayOfImagesViews{
            imgView.image = UIImage(named: arrayOfRandomAnimalNames[number])
            number = number + 1
        }
    }
    // ============================
    func randomAnimalNames(){
        let numberOfAnimals = arrayOfAnimalNames.count
        
        // Repetition entre 0 et 3
        for _ in 1...numberOfAnimals {
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimalNames.append(arrayOfAnimalNames[randomNumber])
           arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
}

