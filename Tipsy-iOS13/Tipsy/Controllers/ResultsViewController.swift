import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var total: Float = 0
    var tipPct: String = "0%"
    var people: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(total)
        print(tipPct)
        totalLabel.text = String(format: "%0.2f", total)
        settingsLabel.text = "Split between \(people) people, with \(tipPct) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
