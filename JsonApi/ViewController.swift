//
//  ViewController.swift
//  JsonApi
//
//  Created by Sujin Shrestha on 9/12/18.
//  Copyright © 2018 Sujin Shrestha. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SQLite3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    final let urlString = "https://jsonplaceholder.typicode.com/posts"
    final let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    private var posts = [Posts]()
    

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        downloadData()
        //        downloadJson()
        //        self.tableView.register(PostsCell.self, forCellReuseIdentifier: "PostsCell")
        //        self.tableView.rowHeight = UITableViewAutomaticDimension
        //        self.tableView.estimatedRowHeight = 200
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("return count...")
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("heree....")
        guard let cell = self.myTableView.dequeueReusableCell(withIdentifier: "PostsCell") as? PostsCell else {
            return UITableViewCell()
            
        }
        
        let post = self.posts[indexPath.row]
        print(post.id)
        cell.textTitle.text = String(post.title)
        cell.textDescription.text = post.body
        // cell.backgroundColor = UIColor.blue
        cell.layoutSubviews()
        return cell
        
    }
    
//    func downloadJson() {
//        guard let downloadURL = url else { return }
//        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
//            guard let data = data, error == nil, urlResponse != nil else {
//                print("Something is wrong")
//                return
//            }
//            print("downloaded")
//            do {
//                let decoder = JSONDecoder()
//                let downloadedPosts = try decoder.decode([Posts].self, from: data)
//                self.posts = downloadedPosts
//                for p in self.posts {
//                    print(p.body)
//                }
//                DispatchQueue.main.async {
//                    print("reloading data...")
//                    self.myTableView.reloadData()
//                }
//
//            } catch {
//                print("Something wrong after downloading...")
//            }
//            }.resume()
//    }
    
    private func downloadData() {
        Alamofire.request(urlString).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")
            //            if let json = response.result.value {
            //                print("JSON: \(json)") // serialized json response
            //            }
            //
            
            do {
                let data = response.data
                let utf8Text = String(data: data!, encoding: .utf8)
                let decoder = JSONDecoder()
                let downloadedPosts = try decoder.decode([Posts].self, from: data!)
                self.posts = downloadedPosts
//                for p in self.posts {
//                    print(p.body)
//                }
                DispatchQueue.main.async {
                    print("reloading data....")
                    self.myTableView.reloadData()
                }
            } catch {
                
            }
        }
    }
    
    
}

