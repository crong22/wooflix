//
//  MovieViewController.swift
//  wooflix
//
//  Created by 여누 on 6/4/24.
//

import UIKit
import SnapKit

class MovieViewController: UIViewController {
    let mainMovieView = UIView()
    let mainMovieImage = UIImageView()
    let mainMovieButton = UIButton()
    let mainMovieSubButton = UIButton()
    let mainTitleLabel = UILabel()
    
    let subTitleLabel = UILabel()
         
    let subMovieOneImage = UIImageView()
    let subMovieTwoImage = UIImageView()
    let subMovieThreeImage = UIImageView()
    
    let flixImage = UIImageView()
    let nowLabel = UILabel()
    let newLabel = UILabel()
    let topImage = UIImageView()
    let newEpisodeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        
    }
    
    func configureHierarchy() {
        
        let array = [mainMovieView, mainMovieImage, subTitleLabel, subMovieOneImage, subMovieTwoImage, subMovieThreeImage, topImage]
        
        for item in array {
            view.addSubview(item)
        }
        
        mainMovieImage.addSubview(mainMovieButton)
        mainMovieImage.addSubview(mainMovieSubButton)
        mainMovieImage.addSubview(mainTitleLabel)
        
        subMovieTwoImage.addSubview(nowLabel)
        subMovieTwoImage.addSubview(newEpisodeLabel)
        subMovieTwoImage.addSubview(topImage)
        
        subMovieThreeImage.addSubview(newLabel)
        subMovieThreeImage.addSubview(flixImage)
    }
    
    
    
    func configureLayout() {
        mainMovieView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(480)
        }
        //메인이미지영화
        mainMovieImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(480)
        }
        //재생 버튼
        mainMovieButton.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.leading.equalTo(10)
            make.height.equalTo(40)
            make.width.equalTo(160)
        }
        //리스트 버튼
        mainMovieSubButton.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.trailing.equalTo(-10)
            make.height.equalTo(40)
            make.width.equalTo(160)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-55)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(40)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(580)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(35)
        }
        
        subMovieOneImage.snp.makeConstraints { make in
            make.top.equalTo(615)
            make.leading.equalTo(20)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        subMovieTwoImage.snp.makeConstraints { make in
            make.top.equalTo(615)
            make.leading.equalTo(146)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        subMovieThreeImage.snp.makeConstraints { make in
            make.top.equalTo(615)
            make.trailing.equalTo(-20)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        
        flixImage.snp.makeConstraints { make in
            make.top.equalTo(2)
            make.leading.equalTo(2)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        nowLabel.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(10)
        }
        
        newEpisodeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(10)
        }
        
        topImage.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.trailing.equalTo(0)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        newLabel.snp.makeConstraints { make in
            make.bottom.equalTo(-0)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(10)
        }
    }
    func configureUI() {
        view.backgroundColor = .black
        navigationItem.title = "새우깡 님"
        mainMovieView.backgroundColor = .red
        mainMovieView.layer.cornerRadius = 10
        mainMovieImage.backgroundColor = .blue
        mainMovieImage.layer.cornerRadius = 10
        let mainImage = UIImage(named: "명량")
        mainMovieImage.image = mainImage
        mainMovieImage.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        mainMovieImage.layer.cornerRadius = 10
        mainMovieImage.clipsToBounds = true
        
        mainTitleLabel.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한국작품"
        mainTitleLabel.textAlignment = .center
        mainTitleLabel.textColor = .white
        mainTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        mainMovieButton.backgroundColor = .white
        mainMovieButton.layer.cornerRadius = 5
        let image = UIImage(systemName: "play.fill")
        mainMovieButton.setImage(image, for: .normal)
        mainMovieButton.tintColor = .black
        mainMovieButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        mainMovieButton.setTitleColor(.black, for: .normal)
        mainMovieButton.setTitle("   재생", for: .normal)
        
        mainMovieSubButton.backgroundColor = .darkGray
        mainMovieSubButton.layer.cornerRadius = 5
        let plusimage = UIImage(systemName: "plus")
        mainMovieSubButton.tintColor = .white
        mainMovieSubButton.setImage(plusimage, for: .normal)
        mainMovieSubButton.setTitle("내가 찜한 리스트", for: .normal)
        mainMovieSubButton.titleLabel?.textAlignment = .center
        mainMovieSubButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        mainMovieSubButton.setTitleColor(.white, for: .normal)
    
        subTitleLabel.text = "지금 뜨는 콘텐츠"
        subTitleLabel.font = .boldSystemFont(ofSize: 16)
        subTitleLabel.textAlignment = .left
        subTitleLabel.textColor = .white
        
        subMovieOneImage.backgroundColor = .gray
        let movieOneImage = UIImage(named: "스즈메의문단속")
        subMovieOneImage.image = movieOneImage
        subMovieOneImage.layer.cornerRadius = 5
        subMovieOneImage.clipsToBounds = true
        
        subMovieTwoImage.backgroundColor = .gray
        let movieTwoImage = UIImage(named: "아바타물의길")
        subMovieTwoImage.image = movieTwoImage
        subMovieTwoImage.layer.cornerRadius = 5
        subMovieTwoImage.clipsToBounds = true
        
        subMovieThreeImage.backgroundColor = .gray
        let movieThreeImage = UIImage(named: "밀수")
        subMovieThreeImage.image = movieThreeImage
        subMovieThreeImage.layer.cornerRadius = 5
        subMovieThreeImage.clipsToBounds = true
        
        let flix = UIImage(named: "single-large 2")
        flixImage.image = flix
        flixImage.clipsToBounds = true
        flixImage.contentMode = .scaleAspectFit
        
        newLabel.backgroundColor = .red
        newLabel.text = "새로운 시리즈"
        newLabel.font = .boldSystemFont(ofSize: 8)
        newLabel.textAlignment = .center
        newLabel.textColor = .white
        
        newEpisodeLabel.backgroundColor = .red
        newEpisodeLabel.text = "새로운 에피소드"
        newEpisodeLabel.font = .boldSystemFont(ofSize: 8)
        newEpisodeLabel.textAlignment = .center
        newEpisodeLabel.textColor = .white
        
        let top = UIImage(named: "top10 badge")
        topImage.image = top
        topImage.clipsToBounds = true
        topImage.contentMode = .scaleAspectFit
        
        nowLabel.backgroundColor = .white
        nowLabel.text = "지금 시청하기"
        nowLabel.font = .boldSystemFont(ofSize: 8)
        nowLabel.textAlignment = .center
        nowLabel.textColor = .black
        
    }
}
