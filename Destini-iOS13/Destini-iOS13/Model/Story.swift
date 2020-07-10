struct Story {
    let title: String
    let choices: [String : Int]
    
    init(parts: [String]) {
        self.title = parts[0]
        self.choices = [parts[1] : Int(parts[2])!, parts[3] : Int(parts[4])!]
    }
}
