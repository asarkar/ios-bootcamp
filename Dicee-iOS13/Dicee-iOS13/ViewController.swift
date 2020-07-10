import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    var diceNumber = 0
    let diceImages = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    override func viewDidLoad() {
        super.viewDidLoad()
//        diceImageView1.image = #imageLiteral(resourceName: "DiceOne")
//        diceImageView1.alpha = 0.5
//        diceImageView2.image = #imageLiteral(resourceName: "DiceOne")
    }
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceNumber += 1
        diceImageView1.image = diceImages[diceNumber]
        diceImageView2.image = diceImages[diceImages.count - diceNumber]
    }
}

