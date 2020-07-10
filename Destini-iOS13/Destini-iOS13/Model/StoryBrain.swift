import Foundation

class StoryBrain {
    var storyNumber: Int = 0
    let stories: [Story]
    
    init() {
        let path = Bundle.main.path(forResource: "stories", ofType: "txt")
        do {
            let data = try String(contentsOfFile: path!, encoding: .utf8)
            let lines = data.components(separatedBy: .newlines)
            stories = lines
                .filter { !$0.isEmpty }
                .map { return Story(parts: $0.components(separatedBy: "|")) }
        } catch {
            fatalError ("Failed to parse stories")
        }
    }
    
    func currentStory() -> Story {
        return stories[storyNumber]
    }
    
    func setNextStory(_ choice: String) -> Void {
        storyNumber = currentStory().choices[choice]!
    }
}

