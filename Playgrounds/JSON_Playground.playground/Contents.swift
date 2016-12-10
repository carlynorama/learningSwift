import UIKit
import Foundation

var jsonString = "{" +
    "\"Language\": {" +
    "\"Field\":[" +
    "{" +
    "\"Number\":\"976\"," +
    "\"Name\":\"Test\"" +
    "}," +
    "{" +
    "\"Number\":\"977\"," +
    "\"Name\":\"Test\"" +
    "}" +
    "]" +
    "}" +
"}"



struct ButtonPress {
    let type: String
    let id: String
    let msg: String
    let min_diff: Double
    let date: String
    let date_epoch: String
    
}

var fakedata = jsonString.data(using: .utf8)!

let json = try? JSONSerialization.jsonObject(with: fakedata)
print(json!)




        let urlString = "https://crashspacela.com/sign2/json/"
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)


do {
    let jsonResult = try! JSONSerialization.jsonObject(with: data!) as? [String:AnyObject]
//    if let jsonResult = jsonResult as? [NSArray: Any] {
    
        print(jsonResult)
        
        let entry = jsonResult[3]; // as? [String: AnyObject];
        print("entry = \(entry)");
        //    let id = entry["id"] as? [String: AnyObject]
        //    let id = entry["id"] as? String:Any;
        //    print("id = \(id)");
        
//    }

} catch {
    print("Failed to load: \(error.localizedDescription)")
}


//let str = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
//let data = str.data(using: String.Encoding.utf8, allowLossyConversion: false)!
//
//do {
//    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
//    if let names = json["names"] as? [String] {
//        print(names)
//    }
//} catch let error as NSError {
//    print("Failed to load: \(error.localizedDescription)")
//}
