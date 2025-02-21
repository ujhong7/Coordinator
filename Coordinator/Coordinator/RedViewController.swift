import UIKit

class RedCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let redVC = RedViewController()
        redVC.coordinator = self
        navigationController.pushViewController(redVC, animated: true)
    }
    
    func showYellowCoordinator() {
        let yellowCoordinator = YellowCoordinator(navigationController: navigationController)
        childCoordinators.append(yellowCoordinator)
        yellowCoordinator.start()
    }
    
    func showBlueVC() {
        let blueVC = BlueViewController()
        navigationController.pushViewController(blueVC, animated: true)
    }
}

class RedViewController: UIViewController {
    weak var coordinator: RedCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let yellowButton = UIButton(type: .system)
        yellowButton.setTitle("노란색 화면으로 이동", for: .normal)
        yellowButton.setTitleColor(.white, for: .normal)
        yellowButton.addTarget(self, action: #selector(goToYellowVC), for: .touchUpInside)
        
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("파란색 화면으로 이동", for: .normal)
        blueButton.setTitleColor(.white, for: .normal)
        blueButton.addTarget(self, action: #selector(goToBlueVC), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [yellowButton, blueButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goToYellowVC() {
        coordinator?.showYellowCoordinator()
    }
    
    @objc func goToBlueVC() {
        coordinator?.showBlueVC()
    }
}
