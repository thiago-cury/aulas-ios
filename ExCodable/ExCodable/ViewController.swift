//
//  ViewController.swift
//  ExCodable
//
//  Created by Thiago  Espindola Cury on 23/05/2019.
//  Copyright © 2019 Thiago Cury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gitUserName: UITextField!
    @IBOutlet weak var labelUserLogin: UILabel!
    @IBOutlet weak var labelUserType: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
    struct GitHub: Codable {
        
        let login: String?
        let name: String?
        let type: String?
        let location: String?
        let followers: Int?
        let avatarUrl: URL?
        let repos: Int?
        
        enum CodingKeys: String, CodingKey {
            case login
            case name
            case type
            case location
            case followers
            case repos = "public_repos"
            case avatarUrl = "avatar_url"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickGetDataGitHub(_ sender: Any) {
        
        let userText = self.gitUserName.text?.lowercased()
        
        guard let gitUrl = URL(string: "https://api.github.com/users/" + userText!) else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHub.self, from: data)
                
                DispatchQueue.main.sync {
                    
                    if let gitImageUser = gitData.avatarUrl {
                        let data = try? Data(contentsOf: gitImageUser)
                        let image: UIImage = UIImage(data: data!)!
                        self.imageUser.image = image
                    }
                    
                    if let gitUserLogin = gitData.login {
                        self.labelUserLogin.text = "Login: "+gitUserLogin
                    }
                    
                    if let gitUserType = gitData.type {
                        self.labelUserType.text = "Tipo: "+gitUserType
                    }
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
}
