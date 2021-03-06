//
//  EmojiArtDocumentTableViewController.swift
//  EmojiArtView_review
//
//  Created by minsoo kim on 30/10/2018.
//  Copyright © 2018 minsoo kim. All rights reserved.
//

import UIKit

class EmojiArtDocumentTableViewController: UITableViewController {

    var emojiArtDocuments = ["one", "two", "three"]
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    @IBAction func newEmojiArt(_ sender: UIBarButtonItem) {
        emojiArtDocuments += ["Untitled".madeUnique(withRespectTo: emojiArtDocuments)]
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArtDocuments.count
    }
    
    
    //TODO : 이상하게, Table View Cell 안에 Text 값을 읽지 못하고, 덮어 쓰는 문제가 있었음. 지금은 TextLabel을 지웠더니 정상동작함. 수정 방법 찾기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)
        print(cell.textLabel?.text)
        print("yeah")
        cell.textLabel?.text = emojiArtDocuments[indexPath.row]
        
        return cell
    }
    

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if splitViewController?.preferredDisplayMode != .primaryOverlay{
            splitViewController?.preferredDisplayMode = . primaryOverlay
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // 아래 두 개는 항상 같아야 함.
            emojiArtDocuments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
