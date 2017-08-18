//
//  BookListTableViewController.swift
//  MyBook
//
//  Created by ktds 20 on 2017. 8. 17..
//  Copyright © 2017년 CJON, Inc. All rights reserved.
//

import UIKit
import Foundation

class BookListTableViewController: UITableViewController, AddBookDelegate {

    var books:[Book] = Array()
    
    func getFilePath(withFileName fileName:String) -> String {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docDir = dirPath[0] as NSString
        print(docDir)
        
        let filePath = docDir.appendingPathComponent(fileName)
        
        return filePath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let filePath = self.getFilePath(withFileName:"test.dat")
//        print("AAA : \(filePath)")
        
//        let book1 = Book(title: "그림으로 배우는 C++ Programming Basic 쉽고 재미있게 배우는 C++ 언어 기초의 모든 것", writer: "Mana Takahashi", publisher: "영진닷컴", coverImage: UIImage(named:"b1")!, price: 16200, description: "『그림으로 배우는 C++ Programming』은 프로그래밍에 익숙하지 않은 초보자들도 쉽고 재미있게 배울 수 있는 C++ 입문서다. 풍부한 일러스트를 통해 어려운 프로그래밍 개념도 그림을 통해 쉽게 이해할 수 있으며, 기초부터 고급 개념까지 마치 책상에 마주 앉아 설명하듯이 구성되어 있기 때문에 초보자들에게도 적합하다. 변수, 연산자, 함수 등 C++ 프로그래밍의 기초 개념부터 포인터, 제네릭 프로그래밍과 STL 등 고급 기능까지 매우 상세하면서 쉽게 설명하고 있다.",url: "http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788931448931&orderClick=LEA&Kc=")
//        
//        let book2 = Book(title: "실리콘밸리 데이터 과학자가 알려주는 따라 하며 배우는 데이터 과학", writer: "권재명", publisher: "제이펍", coverImage: UIImage(named:"b2")!, price: 23400, description: "알리바바의 마윈 회장의 말이다. 현대는 그야말로 데이터의 시대다. 따라서 데이터 과학이 중요해진 이유도 자명하다. 다양한 분야에서 다양한 형태로 많은 양의 데이터가 생성되고 저장되고 있다. 이러한 데이터들을 처리하고 해석하기 위해서는 데이터들을 추출하고 가공하는 코딩 능력과 의미 있는 결론을 끌어낼 수 있는 통계적 능력이 필요하다. ‘프로그래머보다는 통계를 잘하고, 통계학자보다는 코딩을 잘하는’ 데이터 과학자가 필요한 이유일 것이다.", url:"http://www.naver.com")
//        
//        let book3 = Book(title: "쉽고 빠르게 배우는 Vue.js 2 프로그래밍 프로그레시브 자바스크립트 프레임워크", writer: "알렉스 키리아키디스 , 코스타스 매니아티스", publisher: "위키북스", coverImage: UIImage(named:"b3")!, price: 19800, description: "이 책은 이제 막 웹 프런트엔드를 시작했거나 기존 프레임워크의 복잡함에 지친 분들을 위한 책입니다. 이 책에서는 기존의 개발 방법을 우선 살펴보고 Vue.js가 어떻게 간결하게 해결하는지 자세히 설명합니다. 각 장에서는 Vue.js의 특성 하나하나를 자세히 설명하고, 메인 프로젝트 외에 연습문제를 통해 스스로 Vue.js를 익힐 기회를 제공합니다. 후반부에는 Vue.js를 지탱하는 최신 개발 방식을 설명합니다. 그리고 실제 프로젝트에서 사용할 수 있는 기법을 상세히 설명합니다.", url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&linkClass=331405&barcode=9791158390754")
//        
//        
//        
//        
//        
//        self.books.append(book1)
//        self.books.append(book2)
//        self.books.append(book3)
//        
//        let filePath = getFilePath(withFileName: "books")
//        NSKeyedArchiver.archiveRootObject(self.books, toFile: filePath)
//        
//        print("AAAA : \(filePath)")
        
        
        let filePath = self.getFilePath(withFileName: "books")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            if let books = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Book] {
                self.books.append(contentsOf: books)
            }
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let book = self.books[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if let bookCell = cell as? BookTableViewCell {
            
            let numFormatter: NumberFormatter = NumberFormatter()
            numFormatter.numberStyle = NumberFormatter.Style.decimal
            
//            let price = book.price
//            let priceStr = numFormatter.string(from: NSNumber(integerLiteral : price))
            
            if let price = book.price {
                bookCell.bookPriceLabel.text = numFormatter.string(from: NSNumber(integerLiteral : price))
            }
            
            bookCell.bookTitleLabel.text = book.title
            bookCell.bookwriterLabel.text = book.writer
//            bookCell.bookPriceLabel.text = priceStr
            bookCell.bookImageView.image = book.coverImage
            return bookCell
        }
        
        // Configure the cell...
        
//        cell.textLabel?.text = book.title
//        cell.detailTextLabel?.text = book.writer
//        cell.imageView?.image = book.coverImage

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addvc" {
            if let addVC = segue.destination as? AddBookViewController {
                addVC.delegate = self
            }
            
            
            
        } else if segue.identifier == "detailvc" {
            let cell = sender as? UITableViewCell
            
            let vc = segue.destination as? BookDetailViewController
            
            guard let selectedCell = cell, let detailVC = vc else {
                return
            }
            
            if let idx = self.tableView.indexPath(for: selectedCell) {
                detailVC.book = self.books[idx.row]
            }
        }
        
        
        
        
        
    }
    
    func sendNewBook(book:Book) {
        self.books.append(book)
        self.tableView.reloadData()
    }

    
}

class BookTableViewCell : UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookwriterLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    override internal func awakeFromNib(){
        
    }
    
    override internal func setSelected(_ selected: Bool, animated: Bool){
        
    }
}

