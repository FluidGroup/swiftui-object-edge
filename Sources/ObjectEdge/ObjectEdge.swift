import SwiftUI

/**
 It holds an object alongslide the view lifecycle.
 One of the use cases is to hold a model object in a view. 
 */
@propertyWrapper
public struct ObjectEdge<O>: DynamicProperty {
  
  @State private var box: Box<O> = .init()
  
  public var wrappedValue: O {
    if let value = box.value {
      return value
    } else {
      box.value = factory()
      return box.value!
    }
  }
  
  private let factory: () -> O
  
  public init(wrappedValue factory: @escaping @autoclosure () -> O) {
    self.factory = factory
  }
  
  private final class Box<Value> {
    var value: Value?
  }
  
}

#if DEBUG

@available(iOS 17, *)
@Observable
private final class Model {
  
  var count: Int = 0
  
  func up() {
    count += 1
  }
}

@available(iOS 17, *)
private struct Demo: View {
  
  @ObjectEdge var model: Model = .init()
  
  var body: some View {
    
    VStack {
      Text("\(model.count)")
      Button("Up") {
        model.up()
      }
    }
  }
}

@available(iOS 17, *)
#Preview {
  Demo()
}

#endif

