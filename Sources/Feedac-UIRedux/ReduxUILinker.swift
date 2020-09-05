//
//  ReduxUILinker.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import SwiftUI
import Feedac_CoreRedux

public struct ReduxUILinker<S: Feedac_CoreRedux.State, V: View>: View {
    @EnvironmentObject var store: Feedac_CoreRedux.Store<S>
    let content: (S, @escaping (Feedac_CoreRedux.Action) -> Void) -> V
    
    public var body: V {
        content(store.state, store.dispatch(action:))
    }
}
