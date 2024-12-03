import UIKit

final class WishCalendarViewController: UIViewController, UICollectionViewDelegate {
    // MARK: - Properties
    let headingView = WishCalendarHeading()
    
    private let calendarManager = CalendarManager()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = WishCellConstants.minimumLineSpacing
        layout.minimumInteritemSpacing = WishCellConstants.minimumInteritemSpacing
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    var viewModel = WishCalendarViewModel()

    private let noWishesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = WishEventCreationViewConstants.noDataLabel
        label.font = WishEventCreationViewConstants.noDataLabelFont
        label.textColor = WishEventCreationViewConstants.noDataLabelColor
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureHeading()
        configureCollection()
        configureNavigationBar()
        configureNoWishesLabel()
        updateNoWishesLabelVisibility()
    }

    // MARK: - Private methods
    private func configureUI() {
        view.backgroundColor = WishEventCreationViewConstants.viewBackgroundColor
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

    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddButton)
        )
    }

    private func configureNoWishesLabel() {
        view.addSubview(noWishesLabel)
        noWishesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noWishesLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func updateNoWishesLabelVisibility() {
        noWishesLabel.isHidden = !viewModel.shouldShowNoEventsLabel()
    }

    @objc private func didTapAddButton() {
        let creationVC = WishEventCreationView()
        creationVC.delegate = self
        present(creationVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.getEventCount()
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

        let event = viewModel.getEvent(at: indexPath.item)
        wishEventCell.configure(with: event)

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

// MARK: - WishEventCreationViewDelegate
extension WishCalendarViewController: WishEventCreationViewDelegate {
    func didCreateNewEvent(_ event: WishEventModel) {
        // Add the event to the local ViewModel
        viewModel.addEvent(event)
        collectionView.reloadData()
        updateNoWishesLabelVisibility()

        // Map the WishEventModel to CalendarEventModel
        let calendarEvent = WishEventModel(
            title: event.title,
            description: event.description,
            startDate: event.startDate,
            endDate: event.endDate
        )

        calendarManager.create(eventModel: calendarEvent) { success in
            if success {
                print("Event successfully added to the calendar.")
            } else {
                print("Failed to add event to the calendar.")
                DispatchQueue.main.async {
                    let alertController = UIAlertController(
                        title: "Error",
                        message: "The event could not be saved to your calendar. Please check your calendar permissions.",
                        preferredStyle: .alert
                    )
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
