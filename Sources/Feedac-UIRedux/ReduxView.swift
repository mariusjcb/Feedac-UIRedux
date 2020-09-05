//
//  ReduxView.swift
//  
//
//  Created by Marius Ilie on 05/09/2020.
//

import SwiftUI
import Feedac_CoreRedux

public protocol ReduxView: View {
    associatedtype S: Feedac_CoreRedux.State
    associatedtype V: View
    
    associatedtype DataModel
    
    func map(_ state: S, dispatch: @escaping Feedac_CoreRedux.Dispatcher) -> DataModel
    func body(_ dataModel: DataModel) -> V
}

public extension ReduxView {
    func render(_ state: S, dispatch: @escaping Feedac_CoreRedux.Dispatcher) -> V {
        body(map(state, dispatch: dispatch))
    }
    
    var body: ReduxUILinker<S, V> {
        ReduxUILinker(content: render)
    }
}
