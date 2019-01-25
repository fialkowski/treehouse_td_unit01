import UIKit

// Function to determine a passed team average height. Will be used in the process of the team member assignment by average height.
// Total height of all players is divided by the number of players in the team.
func teamTotalHeight(of players: [String : [String : String]]) -> Double {
    if (players.isEmpty) {
        return 0.0
    } else {
        var totalTeamHeight: Double = 0
        for (_, information) in players {
            totalTeamHeight += Double(information["height"] ?? "0.0") ?? 0.0
        }
        return totalTeamHeight
    }
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

// This function prints a list of all players assigned to a passed team
func printMembers(of team: [String : [String : String]]) {
    for (player, information) in team {
        let experience: String
        switch information["experience"] {
        case "yes": experience = "Kicks some ass in soccer!"
        case "no": experience = "Didn't play the game before."
        default: experience = "No exact information on his previous experience."
        }
        print("\n\(player), is \(information["height"] ?? "Who knows how tall.")\" tall\n \(experience) \n Guardian - \(information["Guardian Name"] ?? "You go figure!").")
    }
}

func tallestPlayer(in players: [String : [String : String]]) -> (key: String, information: [String : String]) {
    var tallestPlayerHeight: Double = 0
    var tallestPlayerKey = String()
    var tallestPlayerInformation = [String : String]()
    for (player, information) in players {
        if tallestPlayerHeight < Double(information["height"]!) ?? 0.0 {
            tallestPlayerHeight = Double(information["height"]!) ?? 0.0
            tallestPlayerKey = player
            tallestPlayerInformation = information
        }
    }
    return (tallestPlayerKey, tallestPlayerInformation)
}

//This function assigns player to a team relying on a least total team height

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

print(tallestPlayer(in: players).key)
