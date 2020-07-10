import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    let brain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        brain.setNextStory(sender.titleLabel!.text!)
        updateUI()
    }
    
    func updateUI() -> Void {
        let story = brain.currentStory()
        storyLabel.text = story.title
        var it = story.choices.keys.makeIterator()
        choice1Button.setTitle(it.next(), for: .normal)
        choice2Button.setTitle(it.next(), for: .normal)
    }
}

