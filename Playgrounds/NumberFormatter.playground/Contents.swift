//: Playground - noun: a place where people can play
/*
If you set the usesSignificantDigits property to true, you can configure NSNumberFormatter to display significant digits using the minimumSignificantDigits and maximumSignificantDigits properties. If usesSignificantDigits is false, these properties are ignored.
Otherwise, you can configure the minimum and maximum number of integer and fraction digits, or the numbers before and after the decimal separator, respectively, using the minimumIntegerDigits, maximumIntegerDigits, minimumFractionDigits, and maximumFractionDigits properties.

*/
import UIKit

let calculator_formatter = NumberFormatter()
calculator_formatter.numberStyle = NumberFormatter.Style.decimal
calculator_formatter.maximumSignificantDigits = 8
print(calculator_formatter.string(from: 568988376078.92) as Any)
print(calculator_formatter.string(from: 0.568988376078) as Any)
//provide default value)

let formatter_currency = NumberFormatter()
formatter_currency.numberStyle = NumberFormatter.Style.currency
print(formatter_currency.string(from: 568378.92) ?? 78)
//provide default value)

let formatter_currency2 = NumberFormatter()
formatter_currency2.numberStyle = NumberFormatter.Style.currencyAccounting

print(formatter_currency2.string(from: 568378.92)!)
//(force unwrap)

let formatter_currency3 = NumberFormatter()
formatter_currency3.numberStyle = NumberFormatter.Style.currencyISOCode
formatter_currency3.locale = Locale.autoupdatingCurrent
print(formatter_currency3.string(from: 568378.92) as Any)
//cast as Any

let formatter_currency4 = NumberFormatter()
formatter_currency4.numberStyle = NumberFormatter.Style.currencyPlural
print(formatter_currency4.string(from: 568378.92) as Any)
//cast as Any

let formatter_decimal = NumberFormatter()
formatter_decimal.numberStyle = NumberFormatter.Style.decimal

print(formatter_decimal.string(from: 568378.0) as Any)
//cast as Any

let formatter_ordinal = NumberFormatter()
formatter_ordinal.numberStyle = NumberFormatter.Style.ordinal
print(formatter_ordinal.string(from: 3)!)

let formatter_percent = NumberFormatter()
formatter_percent.numberStyle = NumberFormatter.Style.percent
formatter_percent.minimumFractionDigits = 7
formatter_percent.minimumIntegerDigits = 12
print(formatter_percent.string(from: 0.99)!)

let formatter_scientific = NumberFormatter()
formatter_scientific.numberStyle = NumberFormatter.Style.scientific
print(formatter_scientific.string(from: 0.99)!)

let formatter_none = NumberFormatter()
formatter_none.numberStyle = NumberFormatter.Style.none
print(formatter_none.string(from: 0.99)!)
print(formatter_none.string(from: 2.38)!)
print(formatter_none.string(from: 2.6)!)

let formatter_spell = NumberFormatter()
formatter_spell.numberStyle = NumberFormatter.Style.spellOut
print(formatter_spell.string(from: 0.99)!)
print(formatter_spell.string(from: 2.38)!)
print(formatter_spell.string(from: 2.6)!)

