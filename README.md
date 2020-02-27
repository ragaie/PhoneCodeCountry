# Phone-Code-Country
that give simple component to reuse for your project

# how to used 
1- add pod to your pod file
pod 'CountryCode-Chtar'

then install pod

2- drag an drop view in storyBoard and change it is class to  CodeDropDown

3- create outlet from this view 
 ![alt tag](https://github.com/ragaie/PhoneCodeCountry/blob/master/Screen%20Shot%202020-02-27%20at%202.42.01%20PM.png)

4- conform protocal CountryCodeDropDownDelegate and overwrite method 
    func codeDropDown(_ fromView: CountryCodeDropDown, didSelectItem country: Country)

5- final you find this result 

 ![alt tag](https://github.com/ragaie/PhoneCodeCountry/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-02-27%20at%2014.42.13.png)
 ![alt tag](https://github.com/ragaie/PhoneCodeCountry/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-02-27%20at%2014.42.19.png)


 
 6- at last i hope you find it work ok with you,  you can change design as you like or modify code.

## Author

* **Ragaie alfy Fahmey**  - [ragaie](https://github.com/ragaie)

## You can find me in linked in:- 
- [Ragaie alfy](www.linkedin.com/in/ragaie-alfy)


# MIT License

Copyright (c) 2020 Ragaie alfy fahmey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
