//
//  Movies.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import Foundation

struct Movies: Identifiable {
    var id = UUID().uuidString
    var movieImage: String
    var movieTitle: String
    var movieDescription: String
    var movieRating: Int
    
    var urlImage: URL? {
        return URL(string: movieImage)
    }
    
    static var previews: [Movies] {
        [
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg", movieTitle: "The Flash (2014)", movieDescription: "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only 'meta-human' who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.", movieRating: 78),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg", movieTitle: "Fantastic Beasts: The Secrets of Dumbledore (2022)", movieDescription: "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald's growing legion of followers.", movieRating: 69),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/whZ8OkI7W8cBOmtoiFyb72Ekt3U.jpg", movieTitle: "Yaksha: Ruthless Operations (2022)", movieDescription: "", movieRating: 62),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", movieTitle: "Venom: Let There Be Carnage (2021)", movieDescription: "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.", movieRating: 70),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg", movieTitle: "Thor: Love and Thunder (2022)", movieDescription: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.", movieRating: 55),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg", movieTitle: "The Flash (2014)", movieDescription: "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only 'meta-human' who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.", movieRating: 78),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg", movieTitle: "Fantastic Beasts: The Secrets of Dumbledore (2022)", movieDescription: "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald's growing legion of followers.", movieRating: 69),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/whZ8OkI7W8cBOmtoiFyb72Ekt3U.jpg", movieTitle: "Yaksha: Ruthless Operations (2022)", movieDescription: "", movieRating: 62),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", movieTitle: "Venom: Let There Be Carnage (2021)", movieDescription: "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.", movieRating: 70),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg", movieTitle: "Thor: Love and Thunder (2022)", movieDescription: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.", movieRating: 55)
        ]
    }
    
    static var upcoming: [Movies] {
        [
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg", movieTitle: "Thor: Love and Thunder (2022)", movieDescription: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.", movieRating: 55),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg", movieTitle: "The Flash (2014)", movieDescription: "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only 'meta-human' who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.", movieRating: 78),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg", movieTitle: "Fantastic Beasts: The Secrets of Dumbledore (2022)", movieDescription: "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald's growing legion of followers.", movieRating: 69),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/whZ8OkI7W8cBOmtoiFyb72Ekt3U.jpg", movieTitle: "Yaksha: Ruthless Operations (2022)", movieDescription: "", movieRating: 62),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", movieTitle: "Venom: Let There Be Carnage (2021)", movieDescription: "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.", movieRating: 70),
            Movies(movieImage: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg", movieTitle: "Thor: Love and Thunder (2022)", movieDescription: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.", movieRating: 55)
        ]
    }
    
}
