import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    var total: Float = 0
    var tipPct: String = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        for btn in [zeroPctButton, tenPctButton, twentyPctButton] {
            btn!.isSelected = btn! === sender
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let pct = [zeroPctButton, tenPctButton, twentyPctButton]
            .first(where: { $0!.isSelected })!
        let bill = Float(billTextField.text!)!
        let splitBetween = Float(stepperLabel.text!)!
        
        tipPct = pct!.titleLabel!.text!
        let tip = Float(String(tipPct.first!))! / Float(10)
        total = (bill + bill * tip) / splitBetween
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destVC = segue.destination as! ResultsViewController
            destVC.total = self.total
            destVC.tipPct = self.tipPct
            destVC.people = Int(stepperLabel.text!)!
        }
    }
}

