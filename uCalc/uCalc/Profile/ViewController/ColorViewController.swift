//
//  ProfileViewController.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ColorViewController: UcalcViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colors = ThemeColors.asList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(UINib(nibName: ColorCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: ColorCollectionViewCell.identifier())
        
        //Setup views
        collectionView.hidden = true
        let current = ThemeHelper.defaultColor()
        self.view.backgroundColor = current.mainColor
        navigationBar.barTintColor = current.mainColor
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: - CollectionView DataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ColorCollectionViewCell.identifier(), forIndexPath: indexPath) as! ColorCollectionViewCell
        
        let color = colors[indexPath.row]
        cell.screenImageView.image = color.backgroundImage
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    var currentOffSet : CGFloat = -1
    var currentColor : UIColor?
    /// Change background and navbar colors on collectionview scroll
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let singleWidth = collectionView.contentSize.width / CGFloat(colors.count)
        let position = getColorPosition()
        var color1, color2 : UIColor?
        var ratio : Float
        
        if currentOffSet == -1 || collectionView.contentOffset.x >= collectionView.contentSize.width - singleWidth { // do nothing
            currentOffSet = 0
            return
        } else if collectionView.contentOffset.x < currentOffSet {
            // Is going back
            color2 = colors[position].mainColor
            color1 = colors[position+1].mainColor
            ratio = ((Float(collectionView.contentOffset.x) - Float(singleWidth) * (Float(position) - 1)) / Float(singleWidth)) - 1
        }else {
            // Is going forward
            color1 = colors[position].mainColor
            color2 = colors[position+1].mainColor
            ratio = Float(Float(singleWidth) * (Float(position) + 1) - Float(collectionView.contentOffset.x)) / Float(singleWidth)
        }
        
        let newColor = UiUtils.blendColors(color1!, secondColor: color2!, ratio: ratio)
        navigationBar.barTintColor = newColor
        self.view.backgroundColor = newColor
        
        currentOffSet = collectionView.contentOffset.x
    }
    
    func getColorPosition() -> Int {
        let singleWidth = collectionView.contentSize.width / CGFloat(colors.count)
        return Int(collectionView.contentOffset.x) / Int(singleWidth)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        collectionView.reloadData()
        scrollToSelected()
    }
    
    private func scrollToSelected(){
        let current = ThemeHelper.defaultColor()
        var index = 0
        for i in 0...colors.count{
            if current.label == colors[i].label{
                index = i
                break;
            }
        }
        collectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: index, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
        collectionView.hidden = false
    }
    
    // MARK: - NavigationBar Actions
    
    @IBAction func saveClicked(sender: AnyObject) {
        ThemeHelper.saveColor(colors[getColorPosition()])
        dismissViewControllerAnimated(true, completion: nil)
        AppDelegate.resetTabs()
    }
    
    @IBAction func closeClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
