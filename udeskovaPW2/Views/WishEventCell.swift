import UIKit

final class WishEventCell: UICollectionViewCell {
    static let reuseIdentifier: String = "WishEventCell"
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: WishCellConstants.titleLabelFontSize, weight: .medium)
        label.numberOfLines = WishCellConstants.cellHeadingNumberOfLines
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WishCellConstants.descriptionLabelFontSize, weight: .light)
        label.numberOfLines = WishCellConstants.celldescriptionHeadingNumberOfLines
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WishCellConstants.dateLabelFontSize, weight: .medium, width: .expanded)
        label.numberOfLines = WishCellConstants.cellDateNumberOfLines
        return label
    }()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = WishCellConstants.dateFormat
        return formatter
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell Configuration
    func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
    
        let startDateString = dateFormatter.string(from: event.startDate)
        let endDateString = dateFormatter.string(from: event.endDate)
        
        dateLabel.text = "\(startDateString) - \(endDateString)"
    }

    // MARK: - Private methods
    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, dateLabel])
        stackView.axis = .vertical
        stackView.spacing = WishCellConstants.spacing
        contentView.addSubview(stackView)
        
        stackView.pinHorizontal(to: contentView, WishCellConstants.horizontalPadding)
        stackView.pinVertical(to: contentView, WishCellConstants.verticalPadding)
        
        contentView.layer.cornerRadius = WishCellConstants.cornerRadius
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = WishCellConstants.backgroundColor
    }
}
