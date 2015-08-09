//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Tanner Martin on 8/8/15.
//  Copyright (c) 2015 Tanner Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        b1.layer.borderWidth = 1
        b2.layer.borderWidth = 1
        b3.layer.borderWidth = 1
        
        title = "Guess the Flag"
    }
    
    @IBAction func nextQuestion(sender: UIBarButtonItem)
    {
     countries.shuffle()
        
        b1.setImage(UIImage(named: countries[0]), forState: .Normal)
        b2.setImage(UIImage(named: countries[1]), forState: .Normal)
        b3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = Int(arc4random_uniform(3))
        title = countries[correctAnswer].uppercaseString
        
    }
    
    @IBAction func buttonTapped(sender: UIButton)
    {
        if sender.tag == correctAnswer
        {
            ++score
            //scoreLabel.text = "\(score)"
            updateScoreLabel()
            title = "👍🏼"
        }
        else
        {
            if score > 0
            {
                --score
            }
            //yeah
            //scoreLabel.text = "\(score)"
            updateScoreLabel()
            title = "👎🏼"
        }
    }
    
    //resets the score
    @IBAction func resetScore(sender: UIBarButtonItem)
    {
        score = 0
        updateScoreLabel()
    }
    
    func updateScoreLabel()
    {
        scoreLabel.text = "\(score)"
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

