import UIKit

class YellowCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let yellowVC = YellowViewController()
        yellowVC.coordinator = self
        navigationController.pushViewController(yellowVC, animated: true)
    }
    
    func showGreenVC() {
        let greenVC = GreenViewController()
        navigationController.pushViewController(greenVC, animated: true)
    }
    
    func showOrangeVC() {
        let orangeVC = OrangeViewController()
        navigationController.pushViewController(orangeVC, animated: true)
    }
}

class YellowViewController: UIViewController {
    weak var coordinator: YellowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let greenButton = UIButton(type: .system)
        greenButton.setTitle("초록색 화면으로 이동", for: .normal)
        greenButton.setTitleColor(.black, for: .normal)
        greenButton.addTarget(self, action: #selector(goToGreenVC), for: .touchUpInside)
        
        let orangeButton = UIButton(type: .system)
        orangeButton.setTitle("주황색 화면으로 이동", for: .normal)
        orangeButton.setTitleColor(.black, for: .normal)
        orangeButton.addTarget(self, action: #selector(goToOrangeVC), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [greenButton, orangeButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goToGreenVC() {
        coordinator?.showGreenVC()
    }
    
    @objc func goToOrangeVC() {
        coordinator?.showOrangeVC()
    }
}
