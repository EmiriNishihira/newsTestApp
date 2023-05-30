//
//  NibView.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import UIKit

class NibView: UIView {
    var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
}

private extension NibView {
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        view.frame = bounds
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat: "H:|[childView]|",
                        options: [],
                        metrics: nil,
                        views: ["childView": view as Any])
        )

        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat: "V:|[childView]|",
                        options: [],
                        metrics: nil,
                        views: ["childView": view as Any])
        )
    }
}

extension UIView {
    func loadNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else {
            print("Error load nib.")
            return UIView()
        }
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

