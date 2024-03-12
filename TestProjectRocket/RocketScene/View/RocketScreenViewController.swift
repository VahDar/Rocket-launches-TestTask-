//
//  RocketScreenViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 06.03.2024.
//

import UIKit
import SDWebImage

class RocketScreenViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: RocketScreenViewModelProtocol!
    var rocketCell: RocketViewCell!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rocketCell = RocketViewCell()
        viewModel = RocketScreenViewModel()
        constraints()
        Task {
            await viewModel.getRocketData()
            setupUI(for: 0)
            pageControl.numberOfPages = viewModel.rocketData.count
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let path = UIBezierPath(roundedRect: contentView.bounds,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 30.0, height: 30.0))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        contentView.layer.mask = maskLayer
    }
    
    // MARK: - Views
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.currentPage = 0
        pc.tintColor = .white
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .white
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private let pageControlBackgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 13/255, green: 13/255, blue: 13/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    private let rocketImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "First launch"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let launchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Country"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let whatCountryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Launch cost"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstStageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "FIRST STAGE"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondStageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "SECOND STAGE"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfEnginesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Number of engines"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let enginesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amountOfFuelinTonsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Amount of fuel in tons"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amountOfFuelinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let burnTimeInSecondsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Burn time in sec"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let burnTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNumberOfEnginesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Number of engines"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondAmountOfFuelinTonsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Amount of fuel in tons"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondAmountOfFuelinLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondBurnTimeInSecondsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
        label.textAlignment = .left
        label.text = "Burn time in sec"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondBurnTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Constraints and setupUI
    private func constraints() {
        
        view.addSubview(scrollView)
        view.addSubview(pageControlBackgroundView)
        pageControlBackgroundView.addSubview(pageControl)
        scrollView.addSubview(rocketImageView)
        scrollView.addSubview(contentView)
        [
            rocketNameLabel, rocketCell, firstLaunchLabel, countryLabel, costLabel, firstStageLabel, numberOfEnginesLabel, amountOfFuelinTonsLabel, burnTimeInSecondsLabel, secondStageLabel, secondNumberOfEnginesLabel, secondAmountOfFuelinTonsLabel, secondBurnTimeInSecondsLabel, launchLabel, priceLabel, whatCountryLabel, enginesLabel, amountOfFuelinLabel, burnTimeLabel, secondNumberLabel, secondBurnTimeLabel, secondAmountOfFuelinLabel
        ].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pageControlBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageControlBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControlBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControlBackgroundView.heightAnchor.constraint(equalToConstant: 55),
            
            pageControl.bottomAnchor.constraint(equalTo: pageControlBackgroundView.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: pageControlBackgroundView.centerXAnchor),
            
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 320),
            rocketImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -55),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            rocketNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            rocketCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            rocketCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rocketCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rocketCell.heightAnchor.constraint(equalToConstant: 120),
            
            firstLaunchLabel.topAnchor.constraint(equalTo: rocketCell.bottomAnchor, constant: 25),
            firstLaunchLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            launchLabel.topAnchor.constraint(equalTo: rocketCell.bottomAnchor, constant: 25),
            launchLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            countryLabel.topAnchor.constraint(equalTo: firstLaunchLabel.bottomAnchor, constant: 25),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            whatCountryLabel.topAnchor.constraint(equalTo: launchLabel.bottomAnchor, constant: 25),
            whatCountryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            costLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 25),
            costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            priceLabel.topAnchor.constraint(equalTo: whatCountryLabel.bottomAnchor, constant: 25),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            firstStageLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 50),
            firstStageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            numberOfEnginesLabel.topAnchor.constraint(equalTo: firstStageLabel.bottomAnchor, constant: 25),
            numberOfEnginesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            enginesLabel.topAnchor.constraint(equalTo: firstStageLabel.bottomAnchor, constant: 25),
            enginesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            amountOfFuelinTonsLabel.topAnchor.constraint(equalTo: numberOfEnginesLabel.bottomAnchor, constant: 25),
            amountOfFuelinTonsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            amountOfFuelinLabel.topAnchor.constraint(equalTo: enginesLabel.bottomAnchor, constant: 25),
            amountOfFuelinLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            burnTimeInSecondsLabel.topAnchor.constraint(equalTo: amountOfFuelinTonsLabel.bottomAnchor, constant: 25),
            burnTimeInSecondsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            burnTimeLabel.topAnchor.constraint(equalTo: amountOfFuelinLabel.bottomAnchor, constant: 25),
            burnTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            secondStageLabel.topAnchor.constraint(equalTo: burnTimeInSecondsLabel.bottomAnchor, constant: 50),
            secondStageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            secondNumberOfEnginesLabel.topAnchor.constraint(equalTo: secondStageLabel.bottomAnchor, constant: 25),
            secondNumberOfEnginesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            secondNumberLabel.topAnchor.constraint(equalTo: secondStageLabel.bottomAnchor, constant: 25),
            secondNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            secondAmountOfFuelinTonsLabel.topAnchor.constraint(equalTo: secondNumberOfEnginesLabel.bottomAnchor, constant: 25),
            secondAmountOfFuelinTonsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            secondAmountOfFuelinLabel.topAnchor.constraint(equalTo: secondNumberLabel.bottomAnchor, constant: 25),
            secondAmountOfFuelinLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            secondBurnTimeInSecondsLabel.topAnchor.constraint(equalTo: secondAmountOfFuelinTonsLabel.bottomAnchor, constant: 25),
            secondBurnTimeInSecondsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            
            secondBurnTimeLabel.topAnchor.constraint(equalTo: secondAmountOfFuelinLabel.bottomAnchor, constant: 25),
            secondBurnTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
        ])
        
    }
    
    private func setupUI(for currentPage: Int) {
        view.backgroundColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        rocketCell.translatesAutoresizingMaskIntoConstraints = false
        guard viewModel.rocketData.indices.contains(currentPage) else { return }
            let currentRocket = viewModel.rocketData[currentPage]
        
            rocketCell.configure(with: currentRocket)
            rocketNameLabel.text = currentRocket.name
            launchLabel.text = currentRocket.firstFlight
            whatCountryLabel.text = currentRocket.country
            enginesLabel.text = "\(currentRocket.firstStage.engines)"
            secondNumberLabel.text = "\(currentRocket.secondStage.engines)"
            amountOfFuelinLabel.text = "\(currentRocket.firstStage.fuelAmountTons) ton"
            secondAmountOfFuelinLabel.text = "\(currentRocket.secondStage.fuelAmountTons) ton"
            burnTimeLabel.text = "\(currentRocket.firstStage.burnTimeSEC ?? 0) sec"
            secondBurnTimeLabel.text = "\(currentRocket.secondStage.burnTimeSEC ?? 0) sec"
            let costInMillions = Double(currentRocket.costPerLaunch) / 1_000_000
            
            if floor(costInMillions) == costInMillions {
                priceLabel.text = "$\(Int(costInMillions))mln"
            } else {
                priceLabel.text = "$\(String(format: "%.1f", costInMillions))mln"
            }
            
            if !currentRocket.flickrImages.isEmpty {
                let randomIndex = Int(arc4random_uniform(UInt32(currentRocket.flickrImages.count)))
                let urlString = currentRocket.flickrImages[randomIndex]
                if let url = URL(string: urlString) {
                    rocketImageView.sd_setImage(with: url)
                }
            }
        
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        setupUI(for: sender.currentPage)
    }
}



