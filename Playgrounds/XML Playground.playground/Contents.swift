//: Playground - noun: a place where people can play
// derived from https://gist.github.com/BenziAhamed/60eddd34db29f6d64e29
import UIKit


let xml = "<coord2 count=\"3\">"
    + "<markers>"
    + "<marker>"
    + "<item>marker1</item>"
    + "</marker>"
    + "<marker>"
    + "<item>marker2</item>"
    + "<lat>36</lat>"
    + "</marker>"
    + "</markers>"
    + "</coord2>"


// Simple base class that is used to consume foundCharacters
// via the parser
class ParserBase : NSObject, XMLParserDelegate  {
    
    var currentElement:String = ""
    var foundCharacters = ""
    weak var parent:ParserBase? = nil
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        currentElement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.foundCharacters += string
    }
    
}


// Represents a coord2 tag
// It has a count attribute
// and a collection of markers
class Coord2 : ParserBase {
    
    
    var count = 0
    var markers = [Marker]()
    
    
    
    override func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        print("processing <\(elementName)> tag from Coord")
        
        if elementName == "coord2" {
            
            // if we are processing a coord2 tag, we are at the root
            // of this example
            // extract the count value and set it
            if let c = Int(attributeDict["count"]!) {
                self.count = c
            }
        }
        
        // if we found a marker tag, delegate further responsibility
        // to parsing to a new instance of Marker
        
        if elementName == "marker" {
            let marker = Marker()
            self.markers.append(marker)
            
            // push responsibility
            parser.delegate = marker
            
            // let marker know who we are
            // so that once marker is done XML processing
            // it can return parsing responsibility back
            marker.parent = self
        }
    }
    
    
}

class Marker : ParserBase {
    
    var item = ""
    var lat = 0
    
    func parser(parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("processing <\(elementName)> tag from Marker")
        
        // if we finished an item tag, the ParserBase parent
        // would have accumulated the found characters
        // so just assign that to our item variable
        if elementName == "item" {
            self.item = foundCharacters
        }
            
            // similarly for lat tags
            // convert the lat to an int for example
        else if elementName == "lat" {
            if let l = Int(foundCharacters) {
                self.lat = l
            }
        }
            
            // if we reached the </marker> tag, we do not
            // have anything further to do, so delegate
            // parsing responsibility to parent
        else if elementName == "marker" {
            parser.delegate = self.parent
        }
        
        // reset found characters
        foundCharacters = ""
    }
    
}


let xmlData = xml.data(using: String.Encoding.utf8)!
let parser = XMLParser(data: xmlData)

let coord = Coord2()
parser.delegate = coord

parser.parse()


print("coord has a count attribute of \(coord.count)")
print("coord has \(coord.markers.count) markers")

for marker in coord.markers {
    print("marker item = \(marker.item) and lat = \(marker.lat)")
}

