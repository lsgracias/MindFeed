//
//  Models.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import Foundation

struct Topic: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageURL: String
    var isSelected: Bool
    
    static let allTopics: [Topic] = [
        Topic(name: "Science", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuBSkvMpBnW0KH9V3siB3aE8R26XWvqu1V91PhBF-k313hn8VGFp7NRzGw9W2ttN2w8udv5FRJt3SeMZBYutu0YJnd-bOPYiE4yUReS2uvubWjz7uAhyXmYB4xe-Iz2I-pjGLSHJ0DANx_AOPKHmgPPUEW7JzfngNI5KnrOUny1CmGH_6DhVMbhxYdjdwP6EVfTXzaTqLqYDcZrs7R7_riRjzlyxcmglsGpC5job7LCJfAApjmBKpgSTTKjC-Uq3wRB5vl6bIFLna1o", isSelected: true),
        Topic(name: "History", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuD9wQ0euDOk4HC0jyTLHfmCZEOoZAYYfzDSarJg-LAXS_ddRdPJRNeg79EpM-Z26CJUK5V0Qrl4B9W8Wqy3EDsGjbpil98OD6C4MSOxw37W42Kf8BfEQ7oKms98zoIX1X7OomCL0jFn-GdOjvoKprBwVuKl6joUPf14maECMHMeb8_ymI5Putdo6IJCeq1fOq5FK5gBsLFkv9I6WQVJhNiIJia6EhWCb2TbnZl4__ufV_2Y9EguCrsNUnX1rc_R94VNEaMgY6Tqwag", isSelected: false),
        Topic(name: "Technology", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuDDfm9Sy9NN5-1eEuWyv2gFAvzmP1mQDy83xE1r_fnAYKCuv7oGAnSRv5x7ludtMXJQyliOgGbx65ux7H6egb_3DMDf0y3f5NqlJOMya1eJPNJBmQQn7GjgU85vSIDNu5VBdzEGRWBDdnkiA8p0FJqW0TTOkw9BB0X737XATc-slYrQT1e_kw9QxyVupDvECOGZAUd48jQ4TZqK258aZdlUoW9DmihtM1g6qHH60hiZX_HF-ZM1ukR8Sh5NBIODwrLf5ppIgRmk978", isSelected: true),
        Topic(name: "Mathematics", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuAfvrozKozsiqeEqIFekswhs6_8Sd6DiFOOMJKaZWz3Dog1I4P_s5Rc3WLc8zDl8tC4zTnFdq11jJchITBwbhHdS02GddB0YeHxngLsEt8V4UBf2hqdpZHzvuqvjab_ffhnqNmsUAw5Gu1C1zJCYT0-W3EP2JBs99GO8zLgNkKez1zbGlIdrPXuGhpOKdpcVtkt4TstMq8DhsouActO3UHQfdT0D99jRAbC_n5wKzTIVHVmloYaHRYaE_ecGSlWJtEja6bhTfVise8", isSelected: false),
        Topic(name: "Arts & Culture", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuC7Udc2XXMT9HUeScvDHjqfbCJLX5v2qVyDQoJQGdp_H7S4e928owO5GT8lG9fwoIhhJ0SJjTp5-sPj-a4BfwfqcSHGGTqFsFN57LZGUp4Ix8rZBN_Kahw5-amXSgrdxBoYpIUgNXqapYHtj_c2gM8pL0jSoz9KqgUULxrLvxLVssnShSzn8Uo_xL5tsybS4Jx60ONwAnIVC7mMJt58gvxI7yd9ZZTkAPr5ZasgZIHZwxcalnFbnEEeyex0UQg3YLScYY5ipW06bjA", isSelected: false),
        Topic(name: "Philosophy", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuCJ426yJcfzZxIax5dIZfgX0iGNTORzp_yp_8uDyFMch2wTWAMX7EsqUKKiAQqlKMx7kVekw8GxL1Bg0XoWXmqtDXHUxxzjfX7ztB3BlgvdEcR1k0r8MgRhk_JMXercsNrI6tsiswlZv5VbjaLGkpYmPzz8i4KJ2vfQnKv2w0nWFlek3Abefv0a7F6jrlM7e2jMn9A533SYJSI5C_fJUqrb8Yal_gHw4Hr81Hk0Oi_RwlAkw9lbHy71P4KfcaHQtMZhpUa2MFLHtTU", isSelected: false),
        Topic(name: "Economics", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuAzLBc7yuAdBoEBfZAoGknIbPnQDrWslMFZJYdEMolY8XPvC2qSjiJjPbMylO04meKw2C5MLcqmmVtA7yBcO-aansicVCV0L24tGc3lpQIbiH6sKz4_quRiqrguxWhCgOSfRXInj8yc5498yR4gvYvWzsylN8AJSBn0VSj3KgZQW0_N8HpxFGqVMBgf_9kydZcEn7SVBjREMKudttn4GtfVpWSmgcjqEJjRVH5enC02-DOO2FFXe6n6M93bGBeINr-WsR6KMFM1Jjo", isSelected: true),
        Topic(name: "Literature", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuCX8Vx-_9gOjPGhWEu6UohhZBr-FGV735BbiXX_UHcoBCf8tEkgF3GSZWgPNYn7As7iGPUEBCRzK--lwE3c4XTHL0a8RhUpC1gsDLtqpvRGfZD0Qla-1HxNpuXF2-ZkqzM9TWRlpVF9UQGQuONi7r0JbTa0ROgsAQRf6aOnDkucR8YTegMkO9_yG3hyCxL87EiF8Gnm604Z5DahmZGzynsgSH1XzYJYhq0iPzEg3qctC0AU_2mnwRHtSaupHI6KG-K2WWBpCjk-gOI", isSelected: false),
        Topic(name: "Health & Wellness", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuDQmgA9acpPYaRVIjpMF_V75bQDR55q-7MCNiKa4iO67NVcqdproaDa6jlAY5mUoL9rHrb6iQkYYvytmusicORS9YWvBcWdNDM1833BDWSKEDh2Q8E98xG7LM4ngxYVS2MJNcBsIkmbIpWg7wUhZXMe6rpMAwVZ1ZyE-f6AxAmcT_63tcwf_qZxpin2_gIB11VO4z0fXEoj-pJNHD8WkFjxz0D8u36bWVbZTyBQQvnP-LRtVDNhpH2aoR4Q2X3ufnULGj2Bu0T0rl4", isSelected: false),
        Topic(name: "Computer Science", imageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuDqJUf4JJl9t9ZQBzwt9kx6YMAufmLGF6Qes3Oa1c9p-PKa2K4nB_3r1eeRhRJTaeL1iZA8kxxg8dlwMLVXg3Xsgt-G05YDrjSirtvYoM5pbvX7GaSWozvp2z3ksibkMZ8GXCXyLhDiwuFgPuO-uFeMO9Yf2vx2Blg6tlZ8iw4cxc7_R0WrP3C76tBW_tMu3rTZlsY8OqoFucU01SqUY6ocsGokFcENiV0uKqjukyFt5MibYTliOoNK5OLkBUJHH_lP5u4jVaq1q_o", isSelected: false)
    ]
}

struct Video: Identifiable {
    let id = UUID()
    let title: String
    let creator: String
    let creatorHandle: String
    let creatorImageURL: String
    let description: String
    let thumbnailURL: String
    let videoURL: String
    let tags: [String]
    let likes: Int
    let comments: Int
    let bookmarks: Int
    let shares: Int
    let views: Int
    let duration: String
    let topic: String
    
    static let sampleVideos: [Video] = [
        Video(
            title: "Did you know Saturn's rings are mostly made of ice particles with a smaller amount of rocky debris and dust? Mind-blowing! 🪐",
            creator: "Neil deGrasse Tyson",
            creatorHandle: "@neildegrassetyson",
            creatorImageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuDUBDiIwfh5D4MhCongLYqlfuHQEalr9e2p_3e7zSE_2WBNsRDuvm8fjICdpW-cw05dJOCrxC6_R7pMby5mD-Wj_idnBoEUvZt9FMkCG90cOJlc7gWQqFjKmf-wNwXLAtje4eIMu4wbx97Kuy6CLnIJ33MmSGcG-N7QKii-fudtgLS6R4rS5VuIDZgMbI3jtib1wa8uY62GJGFT9pJ9BNrcz3jY8Y7jZFKBvQjLHRw9kDiMBjxJ-PS6qWyabUURQz56VA2nnUeU10w",
            description: "Join us on a journey to the edge of space and time as we unravel the mysteries of black holes. From their formation to the mind-bending concept of spacetime distortion, this video covers the fundamental principles of one of the universe's most enigmatic phenomena...",
            thumbnailURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuArcARQrxkgNFoeWpr5yAibUz65P8oGxYRm7MiG8gn20bf2-RCczzrM5lswP7Lw5njyxDruT2i_1_KRmPaeaUhu9RBJXti0BFrs9t1CDkOx2z92LZf7fWVCodJZYS4E30c6zbFCXKbmw1Ru0cDARpycwn8Hs6mzcJFIBkwT7OQsEQJU9Be6lXvxOvmfSu-FMNzMlF9__yPQSRI_5ki4CDJnkp-rpj0V7dGTZJsBSv0pM_KBiCj-MVitygZztisVj2EcMIVKkwztL1Q",
            videoURL: "",
            tags: ["Space", "Astronomy", "Science"],
            likes: 12100,
            comments: 345,
            bookmarks: 1800,
            shares: 78,
            views: 2100000,
            duration: "4:30",
            topic: "Science"
        ),
        Video(
            title: "The Paradox of Black Holes Explained",
            creator: "AstroVeritas",
            creatorHandle: "@astroveritas",
            creatorImageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuDUBDiIwfh5D4MhCongLYqlfuHQEalr9e2p_3e7zSE_2WBNsRDuvm8fjICdpW-cw05dJOCrxC6_R7pMby5mD-Wj_idnBoEUvZt9FMkCG90cOJlc7gWQqFjKmf-wNwXLAtje4eIMu4wbx97Kuy6CLnIJ33MmSGcG-N7QKii-fudtgLS6R4rS5VuIDZgMbI3jtib1wa8uY62GJGFT9pJ9BNrcz3jY8Y7jZFKBvQjLHRw9kDiMBjxJ-PS6qWyabUURQz56VA2nnUeU10w",
            description: "Join us on a journey to the edge of space and time as we unravel the mysteries of black holes. From their formation to the mind-bending concept of spacetime distortion, this video covers the fundamental principles of one of the universe's most enigmatic phenomena...",
            thumbnailURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuAVNQYFcGwe0a0UxLYAkT-_VPDMfmCctt8pJvPO-q6sRRBxXcN7sbBofbCuMRdoauzPQoXTAbesp7JADEz9sUDTybWLOgSmIRNZ0cC5ePeRK-A6OZiYAi4_UvMTcPmta4JT2AF5H3dnbogMpPLIR-CsWAYmgpXL5J6ZF5DZ5j2xo7o0COMi3NhBBP_fPRKmvzdhYB8XDtoWuwK8MQ9D8UtL_I3fWSHHLHpNiG9CIYh29Bg4YummWWVABWMps8xkN7EfKErCFQWPj_Y",
            videoURL: "",
            tags: ["Astrophysics", "Quantum Mechanics", "Black Holes"],
            likes: 12300,
            comments: 450,
            bookmarks: 2100,
            shares: 120,
            views: 2100000,
            duration: "4:30",
            topic: "Science"
        )
    ]
}

struct User {
    let name: String
    let username: String
    let profileImageURL: String
    let topicsExplored: Int
    let videosCompleted: Int
    let hoursLearned: Int
    let learningProgress: [LearningProgress]
    let savedVideos: [Video]
    
    static let sample = User(
        name: "Alex Doe",
        username: "@alexdoe",
        profileImageURL: "https://lh3.googleusercontent.com/aida-public/AB6AXuD7e92HGk0RkBV8NWE6ZqAdmW9tRedjo0-7UXI-6uRe88fTpegkmpBJxg1rLwiS0uyXHldmXKHssLxAALCmmqZ27jVGrI-aSozMGxgoONkWrHkRgMW1XktWJuM4pdXTJGbyzLMDBtkdPBDBB3nayqHB2Vh8J3iMWDy-XVpOGzJrpapWLDTOXqlQSoD03L2_2Rz1h7S2leyZY46MsaGo6MwW8-nFw82z8lVQLFRV_pENVHUL0Biwg-qfcPXHcvZNpU1wSVZnuDLTlpQ",
        topicsExplored: 12,
        videosCompleted: 142,
        hoursLearned: 28,
        learningProgress: [
            LearningProgress(topic: "Psychology", percentage: 75),
            LearningProgress(topic: "Quantum Physics", percentage: 40),
            LearningProgress(topic: "Ancient History", percentage: 90)
        ],
        savedVideos: []
    )
}

struct LearningProgress: Identifiable {
    let id = UUID()
    let topic: String
    let percentage: Int
}

