//
//  TransparentBlurView.swift
//  CarMobile
//
//  Created by white4ocolate on 26.12.2024.
//

import Foundation
import SwiftUI

struct TransparentBlurView: UIViewRepresentable {

    var removeAllFilters: Bool = false

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        context.coordinator.setupObservers(for: view)
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        context.coordinator.applyFilters(to: uiView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(removeAllFilters: removeAllFilters)
    }

    class Coordinator {
        var removeAllFilters: Bool

        init(removeAllFilters: Bool) {
            self.removeAllFilters = removeAllFilters
        }

        func setupObservers(for view: UIVisualEffectView) {
            NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { _ in
                self.applyFilters(to: view)
            }
        }

        func applyFilters(to uiView: UIVisualEffectView) {
            DispatchQueue.main.async {
                if let backDropLayer = uiView.layer.sublayers?.first {
                    if self.removeAllFilters {
                        backDropLayer.filters = []
                    } else {
                        backDropLayer.filters?.removeAll(where: { filter in
                            String(describing: filter) != "gaussianBlur"
                        })
                    }
                }
            }
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    }
}

#Preview {
    TransparentBlurView()
}
