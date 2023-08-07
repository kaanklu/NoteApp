import UIKit

class CustomButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            configureEnabledStates()
        }
    }
    

    var leftImage: UIImage? {
        didSet {
            configureLeftImage()
        }
    }
    
    var buttonFont : UIFont? {
        didSet {
            configureButtonTitle()
        }
    }
    
    var buttonTitle: String? {
        didSet {
            setButtonTitle()
        }
    }

    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
        configureButtonTitle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setButton()
        configureButtonTitle()
    }
}

extension CustomButton {
    
    private func setButton() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(named: "myPurple")
        self.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
    }
    
    private func configureButtonTitle() {
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont(name: "Inter-SemiBold", size: 16)
        }
    }
    
    private func configureEnabledStates() {
        if isEnabled {
            self.backgroundColor = UIColor(named: "deepPurple")
            self.setTitleColor(UIColor.white, for: .normal)
        }
        
        if !isEnabled {
            self.backgroundColor = UIColor(named: "myPurple")
            self.setTitleColor(UIColor(named: "deepPurple"), for: .normal)

        }
    }
    
    private func configureLeftImage() {
        if let image = self.leftImage {
            self.setImage(image, for: .normal)
            let edgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
            imageEdgeInsets = edgeInsets
        }
    }
    
    private func setButtonTitle() {
        if let buttonTitle = self.buttonTitle {
            self.setTitle(buttonTitle, for: .normal)
        }
    }
}
