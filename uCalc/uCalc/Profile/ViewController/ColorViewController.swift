//
//  ProfileViewController.swift
//  uCalc
//
//  Created by Alumnos on 8/3/16.
//  Copyright © 2016 Bruno Aybar. All rights reserved.
//

import UIKit

class ColorViewController: UcalcViewController,UIPickerViewDataSource,UIPickerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {
    
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colors = ThemeColors.asList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.reloadAllComponents()
        
        collectionView.registerNib(UINib(nibName: ColorCollectionViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: ColorCollectionViewCell.identifier())
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        collectionView.reloadData()
        setup()
    }
    
    private func setup(){
        let current = ThemeHelper.defaultColor()
        var index = 0
        for i in 0...colors.count{
            if current.label == colors[i].label{
                index = i
                break;
            }
        }
        
        self.view.backgroundColor = colors[0].mainColor
        //collectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: index, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.CenteredVertically, animated: false)
        colorPicker.selectRow(index, inComponent: 0, animated: false)
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
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let singleWidth = collectionView.contentSize.width / CGFloat(colors.count)
        let position = Int(collectionView.contentOffset.x) / Int(singleWidth)
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
        
        self.view.backgroundColor = newColor
        
        currentOffSet = collectionView.contentOffset.x
        
        
    }
    
    
    // MARK: - Picker Delegate & DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].label
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        ThemeHelper.saveColor(colors[row])
        AppDelegate.resetTabs()
        
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
