//
//  RxListVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/05.
//

import UIKit
import RxSwift
import RxCocoa

class RxListVC: UIViewController {
    
    let disposeBag = DisposeBag()
    
    //기존값을 유지하면서 새로운 값 추가 가능
    var memos = BehaviorRelay<[String]>(value: [])
    var memoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!

}

extension RxListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = memoList[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? RxAddVC {
            vc.memoSubjectObservable
                .subscribe(onNext: { [weak self] memo in
                    guard let self = self else { return }
                    
                    var existingMemo = self.memos.value
                    existingMemo.append(memo)
                    self.memos.accept(existingMemo)
                    self.memoList = self.memos.value
                    DispatchQueue.main.async {
                        
                        self.tableView.reloadData()
                    }
                }).disposed(by: disposeBag)
        }
    }
    
}
