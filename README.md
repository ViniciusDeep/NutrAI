# NutrAI
iOS sample project to demonstrate the use of CoreML Models.

The project uses [Food101](https://github.com/stratospark/food-101-keras) CoreMl model to classify the type of food and create tips of meal

The idea is to take a photo of your camera and classify the food, and nutrients of your meal, to provide the best health.


The UIImage is first resized and then converted to a CVPixelBuffer object to can be used by CoreML predict functions.
```swift
let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return (nil, nil)
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
```
Here you can use the prediction at model.
```swift
  guard let prediction = try? model.prediction(image: pixelBuffer) else {
            return
        }
```

<img width="170" height="300" alt="Screen Shot 2019-08-28 at 22 25 25" src="https://user-images.githubusercontent.com/32227073/63227633-ec111400-c1be-11e9-9f3d-7f709ef1a963.png">

<img width="170" height="300" alt="Screen Shot 2019-08-28 at 22 25 25" src="https://user-images.githubusercontent.com/32227073/63227635-ef0c0480-c1be-11e9-8b7c-440ec27e8f39.png">

<img width="170" height="300" alt="Screen Shot 2019-08-28 at 22 25 25" src="https://user-images.githubusercontent.com/32227073/63227637-f206f500-c1be-11e9-8716-8ea7765e290a.png">

<img width="170" height="300" alt="Screen Shot 2019-08-28 at 22 25 25" src="https://user-images.githubusercontent.com/32227073/63227640-f4694f00-c1be-11e9-80d7-6deac89e6a71.png">

<img width="170" height="300" alt="Screen Shot 2019-08-28 at 22 25 25" src="https://user-images.githubusercontent.com/32227073/63227643-f6cba900-c1be-11e9-9b95-daf03112b152.png">

## Author:
Vinicius Mangueira.
Thalys Viana.





