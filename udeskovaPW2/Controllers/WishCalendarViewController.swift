import UIKit

final class WishCalendarViewController: UIViewController {
    // MARK: - Properties
    let headingView = WishCalendarHeading()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = WishCellConstants.minimumLineSpacing
        layout.minimumInteritemSpacing = WishCellConstants.minimumInteritemSpacing
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHeading()
        configureCollection()
    }
    
    // MARK: - Private methods
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func configureHeading() {
        view.addSubview(headingView)
        headingView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, WishCalendarHeadingConstants.topPadding)
        headingView.pinHorizontal(to: view, WishCalendarHeadingConstants.horizontalPadding)
        headingView.setHeight(WishCalendarHeadingConstants.height)
    }

    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = true

        collectionView.register(WishEventCell.self, forCellWithReuseIdentifier: WishEventCell.reuseIdentifier)

        view.addSubview(collectionView)

        collectionView.pinHorizontal(to: view, WishCellConstants.collectionViewMargin)
        collectionView.pinTop(to: headingView.bottomAnchor, WishCalendarHeadingConstants.collectionTopSpacing)
        collectionView.pinBottom(to: view.bottomAnchor)
    }


}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WishEventCell.reuseIdentifier,
            for: indexPath
        )
        
        guard let wishEventCell = cell as? WishEventCell else {
            return cell
        }
        
    
        wishEventCell.configure(
            with: WishEventModel(
                title: "Test \(indexPath.item)",
                description: "Description \(indexPath.item)",
                startDate: .now,
                endDate: .now
            )
        )
        
        return wishEventCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WishCalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width - WishCellConstants.cellWidthMargin
        return CGSize(width: width, height: WishCellConstants.cellHeightSize)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell tapped at index \(indexPath.item)")
    }
}
