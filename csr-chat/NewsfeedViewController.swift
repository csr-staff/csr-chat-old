//
//  NewsfeedViewController.swift
//  csr-chat
//
//  Created by Brandon Sugarman on 5/22/19.
//  Copyright © 2019 Brandon Sugarman. All rights reserved.
//

import UIKit
import Firebase


class NewsfeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var posts: Array<String>!
    var ref: DatabaseReference!
    
    
    @IBAction func goPost(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "writepost")
    }
    
    @IBAction func goHome(_ sender: UIButton) {
        CSRMethods.app.changeScreens(id: "home")

    }
    
    @IBOutlet weak var newsFeed: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = cell.textLabel?.font.withSize(30)
        cell.textLabel?.textColor = UIColor.init(red: 153/255, green: 231/255, blue: 252/255, alpha: 1)
        cell.textLabel?.text = posts[indexPath.item]
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("posts")
        self.posts = []
        // populate usernames/posts
        ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
            // for every user in the database
            for currPost in snapshot.children.allObjects as! [DataSnapshot] {
                let post = currPost.value as! String
                self.posts.append(post)
            }
            self.posts.reverse()
            self.newsFeed.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

