//
//  Constants.swift
//  Evite
//
//  Created by Maitri Brahmbhatt on 12/16/17.
//  Copyright © 2017 Janhavi Parulekar. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
