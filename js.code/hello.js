console.log("Hello");

var x = 10;
var y = 12;
var z = x + y;

console.log(z);

let name = "Anan";
console.log(name + " Mallik");

console.log(typeof name);

let person = {
	name: 'Anan',
	age: 30
}

console.log(person.name, person.age)

let colors = ['red', 'blue', 2, false]
console.log(colors.length)

function greet(name, age, lastname) {
	console.log(name, age, lastname)
}

greet("Sonai", 43, "Mallik")

let myName = "Sonai"

console.log(myName[0] + 'onai')
console.log(myName[1]) 
console.log(myName[2])
console.log(myName[3])
console.log(typeof myName[4])

for(i=0; i<5; i++) {
	console.log(myName[i])
}

function cube(number) {
	return number * number * number
}

let number = cube(3)

console.log(number)

let string = "Averylongstringofletters"

console.log(string.length)


function foo(hello) {
    console.log(hello);
}
function bar(func) {
    func("Hello World!");
}

//alerts "Hello World!"
bar(foo);



