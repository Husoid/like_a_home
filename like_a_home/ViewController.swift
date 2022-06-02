//
//  ViewController.swift
//  like_a_home
//
//  Created by User on 02/06/2022.
//

import UIKit
import ParseSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testParseConnection()
    }
    
    struct GameScore: ParseObject {
        var originalData: Data?
        
        init() {
        
        }
        
            //: Those are required for Object
            var objectId: String?
            var createdAt: Date?
            var updatedAt: Date?
            var ACL: ParseACL?

            //: Your own properties.
            var score: Int = 0

            //: Custom initializer.
            init(score: Int) {
                self.score = score
            }

            init(objectId: String?) {
                self.objectId = objectId
            }
        }

        func testParseConnection(){
            let score = GameScore(score: 10)
            let score2 = GameScore(score: 3)
            score.save { result in
                switch result {
                case .success(let savedScore):
                    assert(savedScore.objectId != nil)
                    assert(savedScore.createdAt != nil)
                    assert(savedScore.updatedAt != nil)
                    assert(savedScore.ACL == nil)
                    assert(savedScore.score == 10)

                    /*: To modify, need to make it a var as the value type
                        was initialized as immutable.
                    */
                    var changedScore = savedScore
                    changedScore.score = 200
                    changedScore.save { result in
                        switch result {
                        case .success(var savedChangedScore):
                            assert(savedChangedScore.score == 200)
                            assert(savedScore.objectId == savedChangedScore.objectId)

                            /*: Note that savedChangedScore is mutable since it's
                                a var after success.
                            */
                            savedChangedScore.score = 500

                        case .failure(let error):
                            assertionFailure("Error saving: \(error)")
                        }
                    }
                case .failure(let error):
                    assertionFailure("Error saving: \(error)")
                }
            }
        }
}

