//
//  ProductCollectionView.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 13.12.2020.
//

import UIKit

class ProductCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    let layout = UICollectionViewFlowLayout()
    var products: Product?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initCollectionView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        initCollectionView()
    }

    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("ProductCollectionView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }

    func initCollectionView(){
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        collectionView.dataSource = self

        let cellWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: cellWidth*0.39, height: 200)
        //Hack for ipod touch View
        if cellWidth == 320{
            layout.itemSize = CGSize(width: cellWidth*0.35, height: 200)
        }
        layout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 40
        collectionView.collectionViewLayout = layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? CollectionViewCell else { fatalError("can't dequeue CustomCell")}
        cell.configure(product: products![indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
}
