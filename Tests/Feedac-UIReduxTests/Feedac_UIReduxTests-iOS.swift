import XCTest
import SwiftUI
import Feedac_CoreRedux
@testable import Feedac_UIRedux

final class Feedac_UIReduxTests_iOS: XCTestCase {
    private let sutStore = Store<SutState>(SutState(), using: SutReducer)
    
    func testSutView() {
        let view = ReduxStoreUIContainer(sutStore) {
            SutView()
        }
        sutStore.dispatch(action: SutIncrementAction())
        
        DispatchQueue.main.async {
            var dataModel = view
                .content()
                .map(self.sutStore.state,
                     dispatch: self.sutStore.dispatch(action:))
            XCTAssert(dataModel.count == 1, "Invalid dataModel count")
            dataModel.onIncrementCount()
            
            DispatchQueue.main.async {
                dataModel = view
                    .content()
                    .map(self.sutStore.state,
                         dispatch: self.sutStore.dispatch(action:))
                XCTAssert(dataModel.count == 2, "Invalid dataModel count after increment")
            }
            
        }
    }

    static var allTests = [
        ("testSutView", testSutView),
    ]
}

fileprivate struct SutIncrementAction: Action { }

fileprivate struct SutState: Feedac_CoreRedux.State {
    var count = 0
}

fileprivate let SutReducer: Reducer<SutState> = { state, action in
    var state = state
    switch action {
    case _ as SutIncrementAction:
        state.count += 1
    default:
        break
    }
    return state
}

fileprivate struct SutView: ReduxView {
    struct DataModel {
        let count: Int
        let onIncrementCount: () -> Void
    }
    
    func text(for dataModel: DataModel) -> String {
        return "\(dataModel.count)"
    }
    
    func map(_ state: SutState, dispatch: @escaping Dispatcher) -> DataModel {
        DataModel(count: state.count) {
            dispatch(SutIncrementAction())
        }
    }
    
    func body(_ dataModel: DataModel) -> some View {
        VStack {
            Text(text(for: dataModel))
            Button(action: dataModel.onIncrementCount) {
                Text("Increment")
            }
        }
    }
}
