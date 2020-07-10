import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImage: UIImageView!
    let ballArray = (1...5).map { UIImage(named: "ball\($0).png")! }
    
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        ballImage.image = ballArray.randomElement()
    }
}

