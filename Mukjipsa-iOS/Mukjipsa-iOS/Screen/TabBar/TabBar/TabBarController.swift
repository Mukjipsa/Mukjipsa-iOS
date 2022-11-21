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
                            title: String,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    private func setTabBar() {
        let recipeTab = makeTabBar(viewController: MyRecipeViewController(),
                                   title: "레시피",
                                   tabBarImg: Constant.Image.tabbarRecipe ?? UIImage(),
                                   tabBarSelectedImg: Constant.Image.tabbarRecipeSelected ?? UIImage(),
                                   renderingMode: .alwaysTemplate)
        let ingredientTap = makeTabBar(viewController: MyIngredientViewController(),
                                       title: "나의 재료",
                                       tabBarImg: Constant.Image.tabbarIngredient ?? UIImage(),
                                 tabBarSelectedImg: Constant.Image.tabbarIngredientSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        let bookmarkTap = makeTabBar(viewController: BookmarkViewController(),
                                     title: "북마크",
                                     tabBarImg: Constant.Image.tabbarBookmark ?? UIImage(),
                                 tabBarSelectedImg: Constant.Image.tabbarBookmarkSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        
        let tabs = [recipeTab, ingredientTap, bookmarkTap]
    
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    private func setRootTabBar() {
        self.selectedIndex = 1
    }
}
