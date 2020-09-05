//
//  ReduxStoreUIContainer.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import SwiftUI
import Feedac_CoreRedux

public struct ReduxStoreUIContainer<S: Feedac_CoreRedux.State, V: View>: View {
    public let store: Feedac_CoreRedux.Store<S>
    public let content: () -> V
    
    public init(_ store: Feedac_CoreRedux.Store<S>, content: @escaping () -> V) {
        self.store = store
        self.content = content
    }
    
    public var body: some View {
        content().environmentObject(store)
    }
}
