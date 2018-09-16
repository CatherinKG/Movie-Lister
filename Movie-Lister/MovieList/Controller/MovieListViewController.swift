//
//  ViewController.swift
//  Movie-Lister
//
//  Created by EVENTORG CATHERINE on 16/09/18.
//  Copyright © 2018 Catherine. All rights reserved.
//

import UIKit


class MovieListViewController: UIViewController {

    @IBOutlet weak var moviePosterCollectionView: UICollectionView!
    var movieData: [MovieDataModel.Content]?
    
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

        ApplicationManger.loadJson(filename: Json.one.name) { (response, error) in
            if error != nil{
                return
            }
            if let response = response{
                movieData = response.page.items.content
            }
        }
    }

}

extension MovieListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellId, for: indexPath) as! MoviePosterCell
        guard let data = movieData else { return cell }
        cell.movieNameLabel.text = data[indexPath.row].name
        cell.posterImageView.image = UIImage(named: data[indexPath.row].imageName)
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
