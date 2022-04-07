# School-Library

Implemented a simple school library app using the full concepts of object oriented programming in ruby. This application takes input and returns the corresponding results from the terminal.

## Getting Started

This repository includes file my_list.rb and enumerable.rb as main program files:

## Clone and review it

Run the following commands to clone and run it.

### To clone the repository

`git clone git@github.com:HAMMAS-SALEEM/School-Library.git`

### To enter Directory

`cd School-Library`

### To Install Gems

`bundle install`

### running the program
- Open `irb` terminal

## Authors

👤 **HAMMAS BIN SALEEM**
- GitHub: [@HAMMAS-SALEEM](https://github.com/HAMMAS-SALEEM)
- Twitter: [@HammasSaleem4](https://twitter.com/HammasSaleem4)
- LinkedIn: [HAMMAS SALEEM](https://www.linkedin.com/in/hammas-saleem)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Inspiration from Microverse
- https://github.com/microverseinc/curriculum-ruby/blob/main/simple-ruby/create_your_own_enumerable.md

## 📝 License

This project is [MIT](./MIT.md) licensed.

require "./student"
require "./teacher"
require "./book"
require "./rentals"
naeem  = Teacher.new(30,"Naeem")
hammas = Student.new(22,"Hammas")
oop = Book.new("OOP", "Tasleem Mustufa")
dbms = Book.new("DBMS", "Tasleem Mustufa")
oop_rent = Rental.new(hammas,dbms,"2022-04-01")