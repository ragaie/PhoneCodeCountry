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
