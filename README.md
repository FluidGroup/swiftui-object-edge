# ObjectEdge

It holds an object alongslide the view lifecycle.
One of the use cases is to hold a model object in a view. 

```swift
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
```

A question about how to use model objects using `@Observable`.  
https://forums.developer.apple.com/forums/thread/739163
