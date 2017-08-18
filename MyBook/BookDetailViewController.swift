//
//  BookDetailViewController.swift
//  MyBook
//
//  Created by ktds 20 on 2017. 8. 17..
//  Copyright © 2017년 CJON, Inc. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var book:Book?
    
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let newBook = self.book else {
            return
        }
        self.bookCoverImageView.image = newBook.coverImage
        self.bookPublisherLabel.text = newBook.publisher
        self.bookWriterLabel.text = newBook.writer
        self.bookPriceLabel.text = String(newBook.price)
        self.bookDescriptionLabel.text = newBook.description
        
        //Title 표시
        self.navigationItem.title = newBook.title
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let webVC = segue.destination as? WebViewController {
            webVC.shopURL = self.book?.url
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
