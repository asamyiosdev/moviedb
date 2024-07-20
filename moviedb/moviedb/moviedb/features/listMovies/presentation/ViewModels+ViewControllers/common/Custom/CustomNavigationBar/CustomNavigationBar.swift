//
//  CustomNavigationBar.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.

import UIKit

extension CustomNavigationBar {
}

class CustomNavigationBar: UIView {
    // MARK: - Properties
    
    @IBInspectable var TitleText: String {
        get { "" }
        set {
            self.titleNavigationLabel?.alpha = 1
            titleNavigationLabel?.text = NSLocalizedString(newValue, comment: "")
        }
    }
    
    @IBInspectable var hidenBackButton: Bool {
        get { false }
        set {
            DispatchQueue.main.async {
                if newValue {
                    self.backButton.isHidden = newValue
                }
            }
        }
    }
    
    @IBInspectable var backImage: UIImage? {
        get { nil }
        set {
            backButton.setImage(newValue, for: .normal)
        }
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var titleNavigationLabel: UILabel?
    @IBOutlet weak var lineShadowView: UIView?
    
    var onBackButtonClicked: (() -> Void)?
    
    private var view = UIView()
    
    // MARK: - Actions
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        onBackButtonClicked?()
    }
    
    // MARK: - Public Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomNavigationBar", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return UIView()
        }
        view.backgroundColor = .clear
        return view
    }
    
    func config(backAction: @escaping () -> Void) {
        self.onBackButtonClicked = backAction
    }

    
    // MARK: - Private Methods
    private func configTitleView(title: String? = "") {
        titleNavigationLabel?.text = title
    }
}
