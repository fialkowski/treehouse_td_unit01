import UIKit

// Function to determine a passed team total height. Will be used in the process of the team member assignment by average height.
func totalHeight(of players: [String : [String : String]]) -> Double {
    var totalTeamHeight: Double = 0
    for (_, information) in players {
        totalTeamHeight += Double(information["height"] ?? "0.0") ?? 0.0
    }
    return totalTeamHeight
}

// This Function Returns a number of experienced player in a passed team
func numberOfExperiencedPlayers(in team: [String : [String : String]]) -> Double {
    var numberOfExperiencedPlayers: Double = 0
    for (_, information) in team {
        if (information["experience"] == "yes"){
        numberOfExperiencedPlayers += 1
        }
    }
    return numberOfExperiencedPlayers
}

//this functiond returns a key and an information for a tallest player in the passed dictionary
func tallestPlayer(withExperience : Bool, in players: [String : [String : String]]) -> (key: String, information: [String : String]) {
    var tallestPlayerHeight: Double = 0 //Will be user as a comparator on line 37 (mutates if the condition on line 37 is satisfied)
    var tallestPlayerKey = String() //A buffer to store a a tallest player key
    var tallestPlayerInformation = [String : String]() //A buffer to store a tallest player information
    var searchParameter = String() //A service variable to mutate a search condition on line 37
    switch withExperience { //switching a parameter for experienced players search
    case true: searchParameter = "yes"
    default: searchParameter = "no"
    }
    for (player, information) in players { //iterating through the passed dictionary
        if (tallestPlayerHeight < Double(information["height"]!) ?? 0.0) &&
           (information["experience"] == searchParameter){
                tallestPlayerHeight = Double(information["height"]!) ?? 0.0
                tallestPlayerKey = player
                tallestPlayerInformation = information
        }
    }
    return (tallestPlayerKey, tallestPlayerInformation)
}

func makeLetters(for team: [String : [String : String]], withPrintName printName: String) -> [String] {
    var letters:[String] = []
    for player in team {
        let string = "\n" +
                     "-------------------------------------------------------------------\n" +
                     "               \(printName) Football Club\n" +
                     "-------------------------------------------------------------------\n" +
                     "\n" +
                     "Dear \(player.value["Guardian Name"] ?? "Parent / Guardian")!\n" +
                     "\n" +
                     "On behalf of \(printName) FC, I'm happy to inform you that\n" +
                     " \(player.key) is now a member of \(printName) Football Club.\n" +
                     "\n" +
                     "--\n" +
                     "\n" +
                     "Best Regards,\n" +
                     "Tara N. Tino\n" +
                     "Team Manager\n" +
                     "-------------------------------------------------------------------\n"
        letters.append(string)
    }
    return letters
}

//This function prints letters for a passed dictionary
func print(_ letters: [String]) {
    for letter in letters {
        print(letter)
    }
}

// Function to print team average height. Will be used in the process of the team member assignment by average height.
func printAverageHeight(for team: [String : [String : String]], withPrintName printName: String){
    var totalTeamHeight: Double = 0
    for (_, information) in team {
        totalTeamHeight += Double(information["height"] ?? "0.0") ?? 0.0
    }
    print("\(printName) Football Team Average height is \(String(format: "%.2f", totalTeamHeight / Double(team.count)))") //formatting a double as string to round an output to 0.00
}

//Declaring empty 2 dimension dictionaries for each soccer team
var teamSharks = [String : [String : String]]()
var teamDragons = [String : [String : String]]()
var teamRaptors = [String : [String : String]]()

//Declaring an empty Array to store letters
var letters = [String]()

//Declaring the Players list as a 2 dimension dictionary
var players: [String : [String : String]] = [
    "Joe Smith":[
        "height" : "42.0",
        "experience" : "yes",
        "Guardian Name" : "Jim and Jan Smith"
    ],
    "Jill Tanner":[
        "height" : "36.0",
        "experience" : "yes",
        "Guardian Name" : "Clara Tanner"
    ],
    "Bill Bon":[
        "height" : "43.0",
        "experience" : "yes",
        "Guardian Name" : "Sara and Jenny Bon"
    ],
    "Eva Gordon":[
        "height" : "45.0",
        "experience" : "no",
        "Guardian Name" : "Wendy and Mike Gordon"
    ],
    "Matt Gill":[
        "height" : "40.0",
        "experience" : "no",
        "Guardian Name" : "Charles and Sylvia Gill"
    ],
    "Kimmy Stein":[
        "height" : "41.0",
        "experience" : "no",
        "Guardian Name" : "Bill and Hillary Stein"
    ],
    "Sammy Adams":[
        "height" : "45.0",
        "experience" : "no",
        "Guardian Name" : "Jeff Adams"
    ],
    "Karl Saygan":[
        "height" : "42.0",
        "experience" : "yes",
        "Guardian Name" : "Heather Bledsoe"
    ],
    "Suzane Greenberg":[
        "height" : "44.0",
        "experience" : "yes",
        "Guardian Name" : "Henrietta Dumas"
    ],
    "Sal Dali":[
        "height" : "41.0",
        "experience" : "no",
        "Guardian Name" : "Gala Dali"
    ],
    "Joe Kavalier":[
        "height" : "39.0",
        "experience" : "no",
        "Guardian Name" : "Sam and Elaine Kavalier"
    ],
    "Ben Finkelstein":[
        "height" : "44.0",
        "experience" : "no",
        "Guardian Name" : "Aaron and Jill Finkelstein"
    ],
    "Diego Soto":[
        "height" : "41.0",
        "experience" : "yes",
        "Guardian Name" : "Robin and Sarika Soto"
    ],
    "Chloe Alaska":[
        "height" : "47.0",
        "experience" : "no",
        "Guardian Name" : "David and Jamie Alaska"
    ],
    "Arnold Willis":[
        "height" : "43.0",
        "experience" : "no",
        "Guardian Name" : "Claire Willis"
    ],
    "Phillip Helm":[
        "height" : "44.0",
        "experience" : "yes",
        "Guardian Name" : "Thomas Helm and Eva Jones"
    ],
    "Les Clay":[
        "height" : "42.0",
        "experience" : "yes",
        "Guardian Name" : "Wynonna Brown"
    ],
    "Herschel Krustofski":[
        "height" : "45.0",
        "experience" : "yes",
        "Guardian Name" : "Hyman and Rachel Krustofski"
    ]
]

// Assigning experienced players
for _ in 0..<Int(numberOfExperiencedPlayers(in: players)) { //here for a better perfomance the code iterates for for the number of experienced players not through the whole thing
    let tallestPlayerKey = tallestPlayer(withExperience: true, in: players).key
    let tallestPlayerInformation = tallestPlayer(withExperience: true, in: players).information
    if tallestPlayerKey != "" { //Protection against writing an empty value into the dictionary
        if (totalHeight(of: teamSharks) >= totalHeight(of: teamRaptors)) && // checking if Raptors is the shortest team
           (totalHeight(of: teamDragons) >= totalHeight(of: teamRaptors)) {
            teamRaptors.updateValue(tallestPlayerInformation, forKey: tallestPlayerKey)
        } else if (totalHeight(of: teamSharks) >= totalHeight(of: teamDragons)) && //checking if Dragons is the shortest team
            (totalHeight(of: teamRaptors) >= totalHeight(of: teamDragons)) {
            teamDragons.updateValue(tallestPlayerInformation, forKey: tallestPlayerKey)
        } else if (totalHeight(of: teamDragons) >= totalHeight(of: teamSharks)) && //checking if Sharks is the shortest team
            (totalHeight(of: teamRaptors) >= totalHeight(of: teamSharks)) {
            teamSharks.updateValue(tallestPlayerInformation, forKey: tallestPlayerKey)
        }
    }
    players.removeValue(forKey: tallestPlayerKey)
}

// Assigning inexperienced players
for _ in 0..<players.count { //iterating through the remaining players
    let tallestPlayerKey = tallestPlayer(withExperience: false, in: players).key
    let tallestPlayerInformation = tallestPlayer(withExperience: false, in: players).information
    if tallestPlayerKey != "" { //Protection against writing an empty value into the dictionary
        if (totalHeight(of: teamSharks) >= totalHeight(of: teamRaptors)) &&
            (totalHeight(of: teamDragons) >= totalHeight(of: teamRaptors)) {
            teamRaptors.updateValue(tallestPlayerInformation, forKey: tallestPlayerKey)
        } else if (totalHeight(of: teamSharks) >= totalHeight(of: teamDragons)) &&
            (totalHeight(of: teamRaptors) >= totalHeight(of: teamDragons)) {
            teamDragons.updateValue(tallestPlayerInformation, forKey: tallestPlayerKey)
        } else if (totalHeight(of: teamDragons) >= totalHeight(of: teamSharks)) &&
            (totalHeight(of: teamRaptors) >= totalHeight(of: teamSharks)) {
            teamSharks.updateValue(tallestPlayerInformation, forKey: tallestPlayerKey)
        }
    }
    players.removeValue(forKey: tallestPlayerKey)
}

letters += makeLetters(for: teamRaptors, withPrintName: "Raptors")
letters += makeLetters(for: teamDragons, withPrintName: "Dragons")
letters += makeLetters(for: teamSharks, withPrintName: "Sharks")
print(letters)
printAverageHeight(for: teamRaptors, withPrintName: "Raptors")
printAverageHeight(for: teamDragons, withPrintName: "Dragons")
printAverageHeight(for: teamSharks, withPrintName: "Sharks")
