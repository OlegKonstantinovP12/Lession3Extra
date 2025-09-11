//
//  main.swift
//  Lession3Extra
//
//  Created by Oleg Konstantinov on 10.09.2025.
//

import Foundation

//MARK: - Задача 1
/*
 Ваша задача состоит в том, чтобы найти все элементы массива, которые не являются последовательными.

 Число не является последовательным, если оно не на один больше предыдущего элемента в массиве. Первый элемент получает проход и никогда не считается непоследовательным.
 Создайте функцию с именем allNonConsecutive
 например, если у нас есть массив [1,2,3,4,6,7,8,15,16], то 6 и 15 не являются последовательными.

 Вы должны возвращать результаты в виде массива кортежей с двумя значениями: индексом непоследовательного числа и непоследовательным числом.

 например, для приведенного выше массива результат должен быть:

 [( 4, 6 ), ( 7, 15 )]

 Если весь массив является последовательным или имеет один элемент, то верните пустой массив.

 Все элементы массива будут цифрами. Все номера также будут уникальными и в порядке возрастания. Цифры могут быть положительными и/или отригательными, а разрыв может быть больше одного.
 Tests
 let possibleConsecutiveArray: [Int] = [1,2,3,4,6,7,8,10]
 let possibleConsecutiveArray: [Int] = [-5,-3,-2,0,1,2,3,4,6,7,8,10]
 let possibleConsecutiveArray: [Int] = [1,2,3,4,5,6,7,8,9,10]
 
 */

let possibleConsecutiveArray: [Int] = [1,2,3,4,6,7,8,10]
var allNonConsecutive: [(Int, Int)] = []

for index in 0...possibleConsecutiveArray.count - 1 {

    if index + 1 != possibleConsecutiveArray.count {
        if possibleConsecutiveArray[index] + 1 != possibleConsecutiveArray[index + 1] {
            allNonConsecutive.append((index + 1, possibleConsecutiveArray[index + 1]))
        }
    }
}
print(allNonConsecutive)

//MARK: - Задача 2
/*
 Создайте функцию, которая возвращает сумму двух наименьших положительных чисел с учетом массива минимум 4 положительных целых чисел. Никакие поплавки или неположительные целые числа не будут переданы.

 Например, когда массив передается как [19, 5, 42, 2, 77], вывод должен быть 7.

 [10, 3434445353, 3453445, 3453545353453] должен вернуть 3453455.
 */

var arr: [Int] = [10, 3434445353, 3453445, 3453545353453] //[19, 5, 42, 2, 77]

let sumOfTwoSmallInt = arr.sorted()
print("Сумма двух наименьших положительных чисел равна \(sumOfTwoSmallInt[0] + sumOfTwoSmallInt[1])")

//MARK: - Задача 3
/*
 Напишите метод, который будет искать в массиве строк для всех строк, которые содержат другую строку, игнорируя заглавные буквы. Затем верните массив найденных строк.

 Метод принимает два параметра, строку запроса и массив строк для поиска, и возвращает массив.

 Если строка не содержится ни в одной из строк в массиве, метод возвращает массив, содержащий одну строку: "Empty" (или Nothing в Haskell, или "None" в Python и C)

 Примеры

 Если строка для поиска - "я", а массив для поиска - ["home", "milk", "Mercury", "fish"], метод должен вернуть ["home", "Mercury"].
 */
/*
 Массивы для проверки
 let searchingString: String = "ab"
 let arrayOfStrings: [String] = ["za", "ab", "abc", "zab", "zbc"], ["ab", "abc", "zab"]
 
 let searchingString: String = "aB"
 let arrayOfStrings: [String] = ["za", "ab", "abc", "zab", "zbc"], ["ab", "abc", "zab"]

 let searchingString: String = "me"
 let arrayOfStrings: [String] = ["home", "milk", "Mercury", "fish"], ["home", "Mercury"]
 */

let searchingString: String = "me"
let arrayOfStrings: [String] = ["home", "milk", "Mercury", "fish"]
var result: [String] = []

for word in arrayOfStrings {
    if word.lowercased().contains(searchingString.lowercased()) {
        result.append(word)
    }
}

if result.isEmpty {
    result.append("Empty")
}
print(result)

//MARK: - Задача 4
/*
 Учитывая массив целых чисел в виде строк и чисел, верните сумму значений массива, как если бы все они были числами.
 Верните свой ответ в виде номера.
 */

let mixedArray: [Any] = ["5", "0", 9, 3, 2, 1, "9", 6, 7]
var count = 0
for number in mixedArray {
    if let numberString = number as? String {
        if let numberInt = Int(numberString) {
            count += numberInt
        }
    }
    if let number = number as? Int {
        count += number
    }
}

print(count)

//MARK: - Задача 5
/*
 Задача

 В этой простой Kata ваша задача - создать функцию, которая превращает строку в мексиканскую волну. Вам будет передана строка, и вы должны вернуть массив строк, где заглавная буква - это человек, стоящий.

 Правила

 1. Входная строка всегда будет состоять из строчных букв и пробелов, но может быть пустой, в этом случае вы должны вернуть пустой массив.
 2. Если символ в строке является пробелом, то пропустите его, как будто это пустое место
 
 "hello" => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
 " s p a c e s " => [ " S p a c e s ", " s P a c e s ", " s p A c e s ", " s p a C e s ", " s p a c E s ", " s p a c e S "]
 */

let inputString: String = "hello"
let ArrayStringElements = Array(inputString.lowercased())
var outputArrayOfStrings: [String] = []

if inputString != "" {
    for char in 0...ArrayStringElements.count - 1 {
        var copyCharArray = ArrayStringElements
        copyCharArray[char] = Character(ArrayStringElements[char].uppercased())
        if copyCharArray[char] != " " {
            let result = String(copyCharArray)
            outputArrayOfStrings.append(result)
        }
    }
}
print(outputArrayOfStrings)

/*
  Разбор этого задания начался с этого решения
let inputString: String = "hello"
var outputArrayOfChar: [String] = []
var outputArrayOfStrings: [String] = []
 
if inputString != "" {
    for char in inputString.lowercased() {
        outputArrayOfChar.append(String(char))
    }
    
    for char in 0...outputArrayOfChar.count - 1 {
        var copyCharArray = outputArrayOfChar
        copyCharArray[char] = outputArrayOfChar[char].uppercased()
        if copyCharArray[char] != " " {
            let result = copyCharArray.reduce("") { $0 + $1 }
            outputArrayOfStrings.append(result)
        }
        
    }
}
*/





