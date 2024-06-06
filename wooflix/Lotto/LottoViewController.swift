//
//  LottoViewController.swift
//  wooflix
//
//  Created by 여누 on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit

class LottoViewController: UIViewController {
    

    // UI선언
    let roundTextField = UITextField()
    let infoLabel = UILabel()
    let infoDateLabel = UILabel()
    
    let numResultLabel = UILabel()
    let resultLabel = UILabel()
    
    let numView = UIView()
    let oneLabel = UILabel()
    let twoLabel = UILabel()
    let threeLabel = UILabel()
    let fourLabel = UILabel()
    let fiveLabel = UILabel()
    let sixLabel = UILabel()
    let plusImage = UIImageView()
    let bonusLabel = UILabel()
    let bonumTextLabel = UILabel()
    
    let picker = UIPickerView()
    
    var list : Array = ["1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 2...2000 {
            list.append("\(i)")
        }
        configureHierarchy()
        configureLayout()
        configurUI()

        picker.delegate = self
        picker.dataSource = self

        
    }
    
    func configureHierarchy() {
        let list = [roundTextField, infoLabel, infoDateLabel, numView ]
        
        for i in list {
            view.addSubview(i)
        }
        
        let numlist = [numResultLabel, resultLabel, oneLabel, twoLabel, threeLabel, fourLabel, fiveLabel, sixLabel, plusImage, bonusLabel, bonumTextLabel]
        
        for item in numlist {
            numView.addSubview(item)
        }
    }

    func configureLayout() {
        roundTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(roundTextField.snp.bottom).offset(40)
            make.leading.equalTo(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        infoDateLabel.snp.makeConstraints { make in
            make.top.equalTo(roundTextField.snp.bottom).offset(40)
            make.trailing.equalTo(-20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        numView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
        
        numResultLabel.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.leading.equalTo(numView.safeAreaLayoutGuide)
            //make.trailing.equalTo(resultLabel)
            make.width.equalTo(173)
            make.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(40)
            //make.leading.equalTo(numResultLabel)
            make.trailing.equalTo(numView.safeAreaLayoutGuide)
            make.width.equalTo(177)
            make.height.equalTo(50)
        }
        
        oneLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(numView.safeAreaLayoutGuide)
        }
        
        twoLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(45)
//            make.leading.equalTo(oneLabel.snp.right).offset(20)
        }
        
        threeLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(90)
        }
        
        fourLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(135)
        }
        
        fiveLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(180)
        }
        
        sixLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(225)
        }
        
        plusImage.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(30)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.leading.equalTo(275)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(numResultLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.leading.equalTo(305)
        }
        
        bonumTextLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusLabel.snp.bottom).offset(-5)
            make.leading.equalTo(300)
            make.height.equalTo(40)
            make.width.equalTo(50)
        }
    }
    
    func configurUI() {
        view.backgroundColor = .white
        
        
        //roundTextField.backgroundColor = .white
        roundTextField.borderStyle = .line
        roundTextField.layer.borderColor = UIColor.systemRed.cgColor //??
        roundTextField.inputView = picker
        
        infoLabel.text = "당첨번호 안내"
        infoLabel.font = .boldSystemFont(ofSize: 14)
        infoLabel.textAlignment = .left
        
        infoDateLabel.text = "2024-06-01 추첨"
        infoDateLabel.font = .boldSystemFont(ofSize: 12)
        infoDateLabel.textAlignment = .right
        infoDateLabel.textColor = .gray
        
        numResultLabel.text = "1122회"
        numResultLabel.textAlignment = .right
        numResultLabel.font = .boldSystemFont(ofSize: 24)
        numResultLabel.textColor = .orange
        
        resultLabel.text = " 당첨결과"
        resultLabel.textAlignment = .left
        resultLabel.font = .boldSystemFont(ofSize: 24)
        resultLabel.textColor = .black

        oneLabel.backgroundColor = .orange
        oneLabel.text = "3"
        oneLabel.layer.cornerRadius = 20
        oneLabel.clipsToBounds = true
        oneLabel.font = .boldSystemFont(ofSize: 14)
        oneLabel.textColor = .white
        oneLabel.textAlignment = .center
        
        twoLabel.backgroundColor = .orange
        twoLabel.text = "6"
        twoLabel.layer.cornerRadius = 20
        twoLabel.clipsToBounds = true
        twoLabel.font = .boldSystemFont(ofSize: 14)
        twoLabel.textColor = .white
        twoLabel.textAlignment = .center
        
        threeLabel.backgroundColor = .red
        threeLabel.text = "21"
        threeLabel.layer.cornerRadius = 20
        threeLabel.clipsToBounds = true
        threeLabel.font = .boldSystemFont(ofSize: 14)
        threeLabel.textColor = .white
        threeLabel.textAlignment = .center
        
        fourLabel.backgroundColor = .red
        fourLabel.text = "30"
        fourLabel.layer.cornerRadius = 20
        fourLabel.clipsToBounds = true
        fourLabel.font = .boldSystemFont(ofSize: 14)
        fourLabel.textColor = .white
        fourLabel.textAlignment = .center
        
        fiveLabel.backgroundColor = .gray
        fiveLabel.text = "34"
        fiveLabel.layer.cornerRadius = 20
        fiveLabel.clipsToBounds = true
        fiveLabel.font = .boldSystemFont(ofSize: 14)
        fiveLabel.textColor = .white
        fiveLabel.textAlignment = .center
        
        sixLabel.backgroundColor = .gray
        sixLabel.text = "35"
        sixLabel.layer.cornerRadius = 20
        sixLabel.clipsToBounds = true
        sixLabel.font = .boldSystemFont(ofSize: 14)
        sixLabel.textColor = .white
        sixLabel.textAlignment = .center
        
        plusImage.image = UIImage(systemName: "plus")
        plusImage.tintColor = .black
        plusImage.layer.cornerRadius = 20
        plusImage.clipsToBounds = true
        
        bonusLabel.backgroundColor = .red
        bonusLabel.text = "22"
        bonusLabel.layer.cornerRadius = 20
        bonusLabel.clipsToBounds = true
        bonusLabel.font = .boldSystemFont(ofSize: 14)
        bonusLabel.textColor = .white
        bonusLabel.textAlignment = .center
        
        bonumTextLabel.text = "보너스"
        bonumTextLabel.textColor = .gray
        bonumTextLabel.textAlignment = .center
        bonumTextLabel.font = .systemFont(ofSize: 12)
    }
    
    

}

extension LottoViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    // Picker section? 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Picker의 목록에 들어가는 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    // Picker 목록 이름
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roundTextField.text = list[row]
        
        let url = "\(APIURL.lottoURL)\(roundTextField.text!)"
        print(url)
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                //print(value.drwNoDate)
                //print(value)
                self.numResultLabel.text = "\(self.roundTextField.text!)회"
                self.resultLabel.text = " 당첨결과"
                
                let labelList = [self.oneLabel, self.twoLabel, self.threeLabel, self.fourLabel, self.fiveLabel, self.sixLabel, self.bonusLabel]
                let numList = [value.drwtNo1, value.drwtNo2, value.drwtNo3, value.drwtNo4, value.drwtNo5, value.drwtNo6, value.bnusNo]
                //    로또 공은 5가지 색깔로 되어 있습니다.
                //    1번부터 10번까지는 노란색입니다.
                //    11번 부터 20번까지는 파란색입니다.
                //    21번부터 30번까지는 빨간색입니다.
                //    31번부터 40번까지는 검은색입니다.
                //    41번부터 45번까지는 초록색입니다.

                for i in 0...6 {
                    if numList[i] > 0 && numList[i] < 11 {
                        labelList[i].backgroundColor = .orange
                    }else if numList[i] > 10 && numList[i] < 21 {
                        labelList[i].backgroundColor = .blue
                    }else if numList[i] > 20 && numList[i] < 31 {
                        labelList[i].backgroundColor = .red
                    }else if numList[i] > 30 && numList[i] < 41 {
                        labelList[i].backgroundColor = .gray
                    }else {
                        labelList[i].backgroundColor = .green
                    }
                }
                self.oneLabel.text = "\(value.drwtNo1)"
                self.twoLabel.text = "\(value.drwtNo2)"
                self.threeLabel.text = "\(value.drwtNo3)"
                self.fourLabel.text = "\(value.drwtNo4)"
                self.fiveLabel.text = "\(value.drwtNo5)"
                self.sixLabel.text = "\(value.drwtNo6)"
                self.bonusLabel.text = "\(value.bnusNo)"
                
                self.infoDateLabel.text = "\(value.drwNoDate) 추첨"

                
            case .failure(let error):
                print(error)
                self.numResultLabel.text = "올바른 값을 "
                self.resultLabel.text = " 입력해주세요"
                self.oneLabel.text = ""
                self.twoLabel.text = ""
                self.threeLabel.text = ""
                self.fourLabel.text = ""
                self.fiveLabel.text = ""
                self.sixLabel.text = ""
                self.bonusLabel.text = ""
                
                self.infoDateLabel.text = ""
            }
        }
    }
}
