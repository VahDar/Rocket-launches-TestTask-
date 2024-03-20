//
//  RocketCollectionViewCell.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 08.03.2024.
//

import SnapKit
import UIKit

class RocketViewCell: UIView {
    
    // MARK: - Properties
    private let settingsViewController = SettingsViewController()
    private var currentHeightUnit: String
    private var currentDiameterUnit: String
    private var currentMassUnit: String
    private var currentPayloadUnit: String
    private var rocket: RocketModel?
    private var textColor: UIColor = UIColor(red: 106/255, green: 106/255, blue: 107/255, alpha: 1)
    
    // MARK - Views
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var heightLabel = label(text: "", textColor: .white, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var heingtTextLabel = label(text: currentHeightUnit == "ft" ? "Height, m" : "Height, ft", textColor: textColor, textAlignment: .center, UIFont.systemFont(ofSize: 13))
       
    private lazy var diameterLabel = label(text: "", textColor: .white, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var diameterTextLabel = label(text: currentDiameterUnit == "ft" ? "Diameter, m" : "Diameter, ft", textColor: textColor, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var massLabel = label(text: "", textColor: .white, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var massTextLabel = label(text: currentMassUnit == "lb" ? "Mass, kg" : "Mass, lb", textColor: textColor, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var payloadLabel = label(text: "", textColor: .white, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var payLoadTextLabel = label(text: currentPayloadUnit == "lb" ? "Payload, kg" : "Payload, lb", textColor: textColor, textAlignment: .center, UIFont.systemFont(ofSize: 13))
    
    private lazy var heightView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var diameterView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var massView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var payloadView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        self.currentHeightUnit = SettingsStorage.getHeightUnit() ?? "ft"
        self.currentDiameterUnit = SettingsStorage.getDiameterUnit() ?? "ft"
        self.currentMassUnit = SettingsStorage.getMassUnit() ?? "lb"
        self.currentPayloadUnit = SettingsStorage.getPayloadUnit() ?? "kg"
        
        super.init(frame: frame)
        updateLabelsText()
        setupLayouts()
        settingsViewController.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func setupLayouts() {
       
        self.addSubview(contentView)
        contentView.addSubview(scrollView)
        scrollView.addSubview(stack)
        stack.addArrangedSubview(heightView)
        stack.addArrangedSubview(diameterView)
        stack.addArrangedSubview(massView)
        stack.addArrangedSubview(payloadView)
        heightView.addSubview(heightLabel)
        heightView.addSubview(heingtTextLabel)
        diameterView.addSubview(diameterLabel)
        diameterView.addSubview(diameterTextLabel)
        massView.addSubview(massLabel)
        massView.addSubview(massTextLabel)
        payloadView.addSubview(payloadLabel)
        payloadView.addSubview(payLoadTextLabel)
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        NSLayoutConstraint.activate([
//            contentView.topAnchor.constraint(equalTo: self.topAnchor),
//            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
//            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 35),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            heightView.heightAnchor.constraint(equalToConstant: 100),
            heightView.widthAnchor.constraint(equalToConstant: 100),
            diameterView.heightAnchor.constraint(equalToConstant: 100),
            diameterView.widthAnchor.constraint(equalToConstant: 100),
            massView.heightAnchor.constraint(equalToConstant: 100),
            massView.widthAnchor.constraint(equalToConstant: 100),
            payloadView.heightAnchor.constraint(equalToConstant: 100),
            payloadView.widthAnchor.constraint(equalToConstant: 100),
            
            heightLabel.topAnchor.constraint(equalTo: heightView.topAnchor, constant: 32),
            heightLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor),
            heingtTextLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 8),
            heingtTextLabel.centerXAnchor.constraint(equalTo: heightView.centerXAnchor),
            
            diameterLabel.topAnchor.constraint(equalTo: diameterView.topAnchor, constant: 32),
            diameterLabel.centerXAnchor.constraint(equalTo: diameterView.centerXAnchor),
            diameterTextLabel.topAnchor.constraint(equalTo: diameterLabel.bottomAnchor, constant: 8),
            diameterTextLabel.centerXAnchor.constraint(equalTo: diameterView.centerXAnchor),
            
            massLabel.topAnchor.constraint(equalTo: massView.topAnchor, constant: 32),
            massLabel.centerXAnchor.constraint(equalTo: massView.centerXAnchor),
            massTextLabel.topAnchor.constraint(equalTo: massLabel.bottomAnchor, constant: 8),
            massTextLabel.centerXAnchor.constraint(equalTo: massView.centerXAnchor),
            
            payloadLabel.topAnchor.constraint(equalTo: payloadView.topAnchor, constant: 32),
            payloadLabel.centerXAnchor.constraint(equalTo: payloadView.centerXAnchor),
            payLoadTextLabel.topAnchor.constraint(equalTo: payloadLabel.bottomAnchor, constant: 8),
            payLoadTextLabel.centerXAnchor.constraint(equalTo: payloadView.centerXAnchor),
        ])
    }
    
    // MARK: - Configure
    func configure(with rocket: RocketModel) {
        updateLabelsText()
        self.rocket = rocket
        heightLabel.text = currentHeightUnit == "ft" ? "\(rocket.height.feet.map { "\($0)" } ?? "N/A")" : "\(rocket.height.meters.map { "\($0)" } ?? "N/A")"
        diameterLabel.text = currentDiameterUnit == "ft" ? "\(rocket.diameter.feet.map { "\($0)" } ?? "N/A")" : "\(rocket.diameter.meters.map { "\($0)" } ?? "N/A")"
        massLabel.text = currentMassUnit == "lb" ? "\(rocket.mass.lb)" : "\(rocket.mass.kg)"
        
        if let payloadLEO = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
            payloadLabel.text = currentPayloadUnit == "lb" ? "\(payloadLEO.lb)" : "\(payloadLEO.kg)"
           } else {
               payloadLabel.text = "N/A"
           }
    }
    
    private func updateLabelsText() {
        
            heingtTextLabel.text = currentHeightUnit == "ft" ? "Height, ft" : "Height, m"
            diameterTextLabel.text = currentDiameterUnit == "ft" ? "Diameter, ft" : "Diameter, m"
            massTextLabel.text = currentMassUnit == "lb" ? "Mass, lb" : "Mass, kg"
            payLoadTextLabel.text = currentPayloadUnit == "lb" ? "Payload, lb" : "Payload, kg"
        }
}

extension RocketViewCell: SettingsDelegate {
    func didChangeHeightUnit(to unit: String) {
        currentHeightUnit = unit
        heingtTextLabel.text = unit == "ft" ? "Height, ft" : "Height, m"
        if let rocket = rocket {
            configure(with: rocket)
        }
    }

    func didChangeDiameterUnit(to unit: String) {
        currentDiameterUnit = unit
        diameterTextLabel.text = unit == "ft" ? "Diameter, ft" : "Diameter, m"
        if let rocket = rocket {
            configure(with: rocket)
        }
    }

    func didChangeMassUnit(to unit: String) {
        currentMassUnit = unit
        massTextLabel.text = unit == "lb" ? "Mass, lb" : "Mass, kg"
        if let rocket = rocket {
            configure(with: rocket)
        }
    }

    func didChangePayloadUnit(to unit: String) {
        currentPayloadUnit = unit
        payLoadTextLabel.text = unit == "lb" ? "Payload, lb" : "Payload, kg"
        if let rocket = rocket {
            configure(with: rocket)
        }
    }
    
    private func label(text: String, textColor: UIColor, textAlignment: NSTextAlignment, _ uiFont: UIFont) -> UILabel {
         let label = UILabel()
         label.text = text
         label.font = uiFont
         label.textColor = textColor
         label.textAlignment = textAlignment
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }
}
