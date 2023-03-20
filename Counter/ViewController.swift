//
//  ViewController.swift
//  Counter
//
//  Created by Кира on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var messageView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    
    var count: Int = 0
    func getDate() -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RUS")
        let format = dateFormatter.string(from: currentDate)
        return format
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messageView.text = "История изменений:\n"
        countLabel.text = "\(count)"
        messageView.isScrollEnabled = false

    }
    @IBAction func tapPlusButton(_ sender: Any) {
        let date = getDate()
        count += 1
        messageView.text.append("\(date) значение изменено на +1\n")
        countLabel.text = "\(count)"
        
    }
    @IBAction func tapMinusButton(_ sender: Any) {
        let date = getDate()
        if count != 0 {
            count -= 1
            messageView.text.append("\(date) значение изменено на -1\n")
            countLabel.text = "\(count)"
        } else {
            messageView.text.append("\(date): попытка уменьшить значение счётчика ниже 0\n")
            countLabel.text = "\(count)"
        }
    }
    @IBAction func tapClearButton(_ sender: Any) {
        let date = getDate()
        count = 0
        messageView.text.append("\(date): значение сброшено\n")
        countLabel.text = "\(count)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        messageView.isScrollEnabled = true
        let range = NSMakeRange(messageView.text.count - 1, 0)
        messageView.scrollRangeToVisible(range)
    }
}

