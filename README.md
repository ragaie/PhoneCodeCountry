# Phone-Code-Country
that give simple component to reuse for your project

# how to used 
1- add pod to your pod file


2- drag an drop view in storyBoard and change it is class to  CodeDropDown
3- create outlet from this view 
 ![alt tag](https://github.com/ragaie/Phone-Code-Country/blob/master/Screen%20Shot%202017-09-25%20at%204.11.49%20PM.png)

4- conform protocal CodeDropDownDelegate and overwrite method 

   func codeDropDown(_ codeDropDown: CodeDropDown, didSelectItem country: Country) {
        selectCountry = country 
    }
5- final you find this result 

 ![alt tag](https://github.com/ragaie/Phone-Code-Country/blob/master/Simulator%20Screen%20Shot%20Sep%2025%2C%202017%2C%205.39.16%20PM.png)


 
 6- at last i hope you find it work ok with you,  you can change design as you like or modify code.
