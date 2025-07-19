//
//  MovieChartViewController.swift
//  wooflix
//
//  Created by 여누 on 6/7/24.
//

import UIKit
import SnapKit
import Alamofire

class MovieChartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mainView = UIView()
    let dateTextField = UITextField()
    let findButon = UIButton()
    
    let mainTableView = UITableView()
    
    let rankTableViewCell = UITableViewCell()
    
    var list : MovieData?
    var moviedate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest()
        configureHierarchy()
        configureTableView()
        configureUI()
        
        findButon.addTarget(self,action : #selector(findButtonClicked) , for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieRankTableViewCell.identifier , for: indexPath) as! MovieRankTableViewCell
        cell.rankLabel.text = list?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].rank
        cell.movieLabel.text = list?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        cell.dateLabel.text = list?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].openDt
        return cell
    }
    
    
    func configureUI() {
        view.backgroundColor = .black
        mainTableView.backgroundColor = .black
        dateTextField.backgroundColor = .white
        
        findButon.backgroundColor = .white
        findButon.setTitle("검 색", for: .normal)
        findButon.titleLabel?.font = .boldSystemFont(ofSize: 14)
        findButon.setTitleColor(.black, for: .normal)
    }
    
    func configureHierarchy() {
        view.addSubview(mainTableView)
        view.addSubview(dateTextField)
        view.addSubview(findButon)
    }
    
    func configureTableView() {
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(200)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalTo(10)
            make.trailing.equalTo(-100)
            make.height.equalTo(40)
        }
        findButon.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(-10)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
        
        
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(MovieRankTableViewCell.self, forCellReuseIdentifier: MovieRankTableViewCell.identifier)
        
    }
    @objc func findButtonClicked() {
        let alert = UIAlertController(title: "오 류", message: "8자리 이하로 입력해주세요", preferredStyle: .alert)
        let alert2 = UIAlertController(title: "오 류", message: "8자리로 입력해주세요\n 예시) 20240606", preferredStyle: .alert)
        print(dateTextField.text!.count)
        
        if dateTextField.text!.count > 8 {
            let warning = UIAlertAction(title: "확 인", style: .cancel)
            alert.addAction(warning)
            present(alert,animated: true)
            dateTextField.text = ""
        }else if dateTextField.text!.count < 8{
            let warning = UIAlertAction(title: "확 인", style: .cancel)
            alert2.addAction(warning)
            present(alert2,animated: true)
            dateTextField.text = ""
        }else {
            moviedate = dateTextField.text!
            print(moviedate)
            callRequest()
        }
        
    }
    
    func callRequest() {
        print(#function, "aaaa")
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1 ,to: Date())
        let dateResult = format.string(from: yesterday!)
        if dateTextField.text == "" {
            moviedate = dateResult
        }else {
            moviedate = dateTextField.text!
        }
        
        let movieurl = "\(APIURL.movieURL)\(moviedate)"
        if let url = URL(string: movieurl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(MovieData.self, from: JSONdata)
                        self.list = decodeData
                        
                        DispatchQueue.main.async{
                            self.mainTableView.reloadData()
                        }
                        print("저장완료")
                    } catch {
                        print(error)
                    }
                }
            }
                task.resume()
            }
        
    }
}
