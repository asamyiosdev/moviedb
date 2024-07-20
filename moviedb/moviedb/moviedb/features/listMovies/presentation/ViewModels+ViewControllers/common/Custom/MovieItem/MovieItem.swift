//
//  MovieItem.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.

import UIKit

protocol MovieListViewDelegate: AnyObject {
    func numberOfItems() -> Int
    func item(indexPath: IndexPath) -> Movie?
    func showMoreButton() -> Bool
    func loadMore()
}

extension MovieItem {
}

class MovieItem: UIView {
    // MARK: - Properties
    
    private var view = UIView()
    
    private var isLoadingMore: Bool = false
    
    weak var delegate: MovieListViewDelegate?
    
    
    @IBOutlet weak var navigationBarView: CustomNavigationBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var loadMoreView: UIView!
    
    // MARK: - Properties
    
    
    
    var dataChanged: (() -> Void)?
    
    // MARK: - Actions
    
    
    // MARK: - Public Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MovieItem", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return UIView()
        }
        view.backgroundColor = .clear
        
        
        collectionView.register(UINib(nibName: "MovieItemCell", bundle: nil), forCellWithReuseIdentifier: "MovieItemCell")
        
        configCollectionView()
        return view
    }
    
    func configView(title: String? = "") {
        navigationBarView.TitleText = title ?? ""
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    @IBAction func loadMoreButtonClicked(_ sender: Any) {
        
    }
    
    
}



// MARK: - UICollection View Methods

extension MovieItem: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let WidthItem = screenWidth / 2 - 24
        let minimumLineSpacing = 16.0
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = minimumLineSpacing
        layout.itemSize = CGSize(width: WidthItem, height: 250)
        collectionView.collectionViewLayout = layout
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 64, right: 16)
        showLoadMore(show: false)
        
        self.collectionView.reloadData()
    }
    
    // MARK: - ----------------------{ CollectionView delegete }-----------------------
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return delegate?.numberOfItems() ?? 0
        }else {
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieItemCell", for: indexPath) as? MovieItemCell else {
            return UICollectionViewCell()
        }
        
        
        
        guard let item =  delegate?.item(indexPath: indexPath) else { return UICollectionViewCell() }
        cell.configureCell(movie: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    private func loadMoreDataIfNeeded() {
        // Check if we're currently loading more data
        guard !isLoadingMore else { return }
        
        let showMoreButton =  delegate?.showMoreButton() ?? false
        if(showMoreButton){
            // Check if the user has scrolled to the end
            let indexPaths = collectionView.indexPathsForVisibleItems
            if let lastIndexPath = indexPaths.last  {
                let numberOfItems = delegate?.numberOfItems() ?? 0
                if(lastIndexPath.row > numberOfItems - 5){
                    
                    showLoadMore(show: true)
                }else {
                    showLoadMore(show: false)
                }
                
                print(lastIndexPath.row)
                
            }
        }
    }
    
    private func fetchData() {
        isLoadingMore = false
        collectionView.reloadData()
    }
    
    func showLoadMore(show:Bool){
        self.loadMoreView.isHidden = !show
    }
}



extension MovieItem: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            loadMoreDataIfNeeded()
        }
    }
    
}

