//
//  ModalHalfView.swift
//  PickUp
//
//  Created by David Reynolds on 6/22/21.
//

import SwiftUI

struct ModalHalfView<EventDetailsBoxView: View>: View {
    @Binding var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let EventDetailsBoxView: EventDetailsBoxView

    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> EventDetailsBoxView) {
        self.minHeight = maxHeight * EventDetailsBoxView.minHeightRatio
        self.maxHeight = maxHeight
        self.content = EventDetailsBoxView()
        self._isOpen = isOpen
    }
}


private var offset: CGFloat {
    isOpen ? 0 : maxHeight - minHeight
}

private var indicator: some View {
    RoundedRectangle(cornerRadius: Constants.radius)
        .fill(Color.secondary)
        .frame(
            width: Constants.indicatorWidth,
            height: Constants.indicatorHeight
    )
}

var body: some View {
    GeometryReader { geometry in
        VStack(spacing: 0) {
            self.indicator.padding()
            self.content
        }
        .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(Constants.radius)
        .frame(height: geometry.size.height, alignment: .bottom)
        .offset(y: self.offset)
    }
}


@GestureState private var translation: CGFloat = 0

var body: some View {
    GeometryReader { geometry in
        VStack(spacing: 0) {
            self.indicator.padding()
            self.content
        }
        .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(Constants.radius)
        .frame(height: geometry.size.height, alignment: .bottom)
        .offset(y: max(self.offset + self.translation, 0))
        .animation(.interactiveSpring(), value: isOpen)
        .animation(.interactiveSpring(), value: translation)
        .gesture(
            DragGesture().updating(self.$translation) { value, state, _ in
                state = value.translation.height
            }.onEnded { value in
                let snapDistance = self.maxHeight * Constants.snapRatio
                guard abs(value.translation.height) > snapDistance else {
                    return
                }
                self.isOpen = value.translation.height < 0
            }
        )
    }
}
