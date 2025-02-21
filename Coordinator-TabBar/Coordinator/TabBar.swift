import UIKit

class TabBarCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        // 1번 탭
        let redVC = RedViewController()
        let redNavController = UINavigationController(rootViewController: redVC)
        redNavController.tabBarItem = UITabBarItem(title: "Red", image: nil, selectedImage: nil)
        
        // 2번 탭
        let purpleVC = PurpleViewController()
        let purpleController = UINavigationController(rootViewController: purpleVC)
        purpleController.tabBarItem = UITabBarItem(title: "Purple", image: nil, selectedImage: nil)
        
        // 탭 바에 네비게이션 컨트롤러들 추가
        tabBarController.viewControllers = [redNavController, purpleController]
        tabBarController.tabBar.backgroundColor = .white
       
        // 1번 탭: 코디네이터
        let redCoordinator = RedCoordinator(navigationController: redNavController)
        childCoordinators.append(redCoordinator)
        redCoordinator.start()
        
        // 2번 탭: 코디네이터
        
        // 최상위 윈도우의 루트 뷰 컨트롤러로 탭 바 설정
        navigationController.viewControllers = [tabBarController]
    }
}
