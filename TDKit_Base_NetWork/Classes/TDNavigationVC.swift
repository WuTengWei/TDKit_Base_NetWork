//
//  TDNavigationVC.swift
//  TDStarMall
//
//  Created by 邓文磊 on 2019/4/17.
//  Copyright © 2019 tiens. All rights reserved.
//

import UIKit

public class TDNavigationVC: UINavigationController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor=MainColor
        
        navigationBar.isTranslucent=false
    //navigationBar.titleTextAttributes=[NSAttributedString.Key.font:FontPFMediumSize(18),NSAttributedString.Key.foregroundColor:RGBColor(51,51,51)]
        
        navigationBar.barTintColor=UIColor.white
    //仅用这句话去掉导航栏下面的线,在10系统以上管用,10线依然存在,解决办法找UI要图,再设个背景图就好了
        navigationBar.shadowImage = UIImage()
        
        interactivePopGestureRecognizer?.delegate=self
    }
    
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0{
            
            viewController.hidesBottomBarWhenPushed=true
        viewController.navigationItem.leftBarButtonItem=UIBarButtonItem(image: UIImage(named: "navBack"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftBtnDidClick))
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    
    @objc func leftBtnDidClick(){
        popViewController(animated: true)
    }
    
    override public var childForStatusBarStyle: UIViewController?{
        
        return visibleViewController
    }
    
    func getImageFromView() -> UIImage {
        
        //下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
        
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        
        view.layer.render(in: context!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
}

extension TDNavigationVC:UIGestureRecognizerDelegate{
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return children.count != 1
    }
    
}
