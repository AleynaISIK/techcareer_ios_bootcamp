import UIKit

//Optional - Nullable - Null Safety
//nil, null, NaN

//? , !

var str = "Hello"
//Tanımlama
var mesaj: String? = nil
var mesaj2: String? //bu şekilde kısaltabilirsin

mesaj = "merhaba"

if mesaj != nil{
  print(mesaj!) //unwrapped
}else{
  print("mesaj nil'dir")
}

//Optional Binding

if let temp = mesaj {//nil ise false , nil değilse true
  print(temp) //otomatik unwrapped
}else{
  print("mesaj nil'dir")

}


if var temp = mesaj {//nil ise false , nil değilse true
  print(temp) //otomatik unwrapped
  temp = "Nasılsın"
  print(temp)
}else{
  print("mesaj nil'dir")

}


