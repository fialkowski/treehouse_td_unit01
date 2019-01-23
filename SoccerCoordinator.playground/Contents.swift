import UIKit

//creating a player dictionary

let players: [String : [String : String]] = [
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

//Iterating through the whole dictionary and printing the stored information
for (player, information) in players {
    let experience: String
    switch information["experience"] {
    case "yes": experience = "Kicks some ass in soccer!"
    case "no": experience = "Didn't play the game before."
    default: experience = "No exact information on his previous experience."
    }
    print("\n\(player), is \(information["height"] ?? "Who knows how tall.")\" tall\n \(experience) \n Guardian - \(information["Guardian Name"] ?? "You go figure!").")
}
