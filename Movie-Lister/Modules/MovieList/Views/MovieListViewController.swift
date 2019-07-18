//
//  ViewController.swift
//  Movie-Lister
//
//  Created by   CATHERINE on 16/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var moviePosterCollectionView: UICollectionView!
    
    let manager = MovieListManager()
    var movieData: [MovieDataModel.Content] = []
    var totalCount: Int = 54
    var pageNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.navigationController?.navigationBar.setBackground()
        self.fetchData()
    }
    
    fileprivate func registerCell() {
        moviePosterCollectionView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.cellId)
    }

    fileprivate func fetchData(){

        manager.loadJson(pageNumber: pageNumber) { (response, error) in
            if error != nil{
                return
            }
            if let response = response{
                movieData.append(contentsOf: response.page.items.content)
                pageNumber = (response.page.pageNo as NSString).integerValue + 1
                self.moviePosterCollectionView.reloadData()
            }
        }
    }

}

extension MovieListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellId, for: indexPath) as! MoviePosterCell
        cell.name = movieData[indexPath.item].name
        cell.image = movieData[indexPath.item].imageName
        return cell
    }
    
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize() }
        
        let interItemSpacing = layout.minimumInteritemSpacing
        let sectionInsets    = layout.sectionInset.left + layout.sectionInset.right
        return CGSize(width: Int((collectionView.frame.width - 2 * interItemSpacing - sectionInsets)/3), height: 200)
        
    }
}

extension MovieListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if moviePosterCollectionView.contentOffset.y >= (moviePosterCollectionView.contentSize.height - moviePosterCollectionView.frame.size.height) {
            
            guard movieData.count < totalCount else { return }
            fetchData()
        }
    }
    
}
