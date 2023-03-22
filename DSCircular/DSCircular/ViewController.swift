//
//  ViewController.swift
//  DSCircular
//
//  Created by Sivakumar R on 21/03/23.
//

import UIKit
 
//import DSCircularCollectionView

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let colours : [UIColor] = [.green,.red,.blue,.yellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    
        let circularLayout = DSCircularLayout()
        circularLayout.centre = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height)
        circularLayout.radius = 500
        circularLayout.angularSpacing = 10
        circularLayout.itemSize = CGSize(width: self.view.frame.size.width/2, height: self.view.frame.size.height/2 - 40 )
        circularLayout.setStartAngle(.pi, endAngle: 0)
        circularLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        circularLayout.mirrorX = false
        circularLayout.mirrorY = false
        circularLayout.setStartAngle(.maximum(1, 2), endAngle: .minimum(1,2))
        collectionView.setCollectionViewLayout(circularLayout, animated: true)
        
        collectionView.register(UINib(nibName: "ViewCell", bundle: nil), forCellWithReuseIdentifier: "ViewCellId")
    }


}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewCellId", for: indexPath) as! ViewCell
        
        cell.img.backgroundColor = colours.randomElement()
        cell.lbl.text = "\(indexPath.row)"
        return cell
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

