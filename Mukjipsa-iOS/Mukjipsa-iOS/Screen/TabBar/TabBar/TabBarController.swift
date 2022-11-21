//
//  TabBarController.swift
//  Mukjipsa-iOS
//
//  Created by 황찬미 on 2022/11/01.
//
import UIKit

class TabBarController: UITabBarController {

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setRootTabBar()
    }
}

extension TabBarController {
    private func makeTabBar(viewController: UIViewController,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: "",
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    private func setTabBar() {
//        let friendTab = makeTabBar(viewController: FriendViewController(),
//                                   tabBarImg:  ?? UIImage(),
//                                   tabBarSelectedImg:  ?? UIImage(),
//                                   renderingMode: .alwaysTemplate)
//        let talkTab = makeTabBar(viewController: TalkViewController(),
//                                 tabBarImg:  ?? UIImage(),
//                                 tabBarSelectedImg:  ?? UIImage(),
//                                 renderingMode: .alwaysTemplate)
//        let viewTab = makeTabBar(viewController: ViewViewController(),
//                                 tabBarImg:  ?? UIImage(),
//                                 tabBarSelectedImg:  ?? UIImage(),
//                                 renderingMode: .alwaysTemplate)
//        let shopTab = makeTabBar(viewController: ShopViewController(),
//                                 tabBarImg:  ?? UIImage(),
//                                 tabBarSelectedImg:  ?? UIImage(),
//                                 renderingMode: .alwaysTemplate)
//        let settingTab = makeTabBar(viewController: SettingViewController(),
//                                    tabBarImg:  ?? UIImage(),
//                                    tabBarSelectedImg:  ?? UIImage(),
//                                    renderingMode: .alwaysTemplate)
        
        let recipeViewController = MyRecipeViewController()
        let myIngredientViewController = MyIngredientViewController()
        let BookMarkViewController = BookmarkViewController()
        
        let tabs = [myIngredientViewController, recipeViewController, BookMarkViewController]
    
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .systemGray6
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
    }
    
    private func setRootTabBar() {
        self.selectedIndex = 1
    }
}
