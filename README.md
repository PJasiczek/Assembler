# Assembler
> This repository contains programs written in At&amp;T Assembly for the needs of laboratory classes.

## Table of contents
* [General info](#general-info)
    * lab1/zad1
    * lab1/zad2
    * lab2
    * lab3
    * lab4
    * lab5
    * lab6
* [Setup](#setup)
* [Status](#status)
* [Contact](#contact)

## General info

* lab1/zad1 - the <b>swap.s</b> program is a program that edits a constant string so that the initial letters in this string are exchanged with the final ones in the text, respectively. It is done in such a way that we exchange the first character appearing in the text with the last one. Then the second with the penultimate until the counters after each operation will be equal.
* lab1/zad2 - program <b>lower.s</b> is a program that converts uppercase letters in the string to their small counterparts. The result of the program is text containing only lowercase letters.
* lab2 - program calculating the Fibbonate string result for a string of the given length. The maximum word for which we want to determine the value of its index in the string is entered in the section .data for the variable NR_WYRAZU. The result of consecutive values for further string words are visible in the% edi register and depending on the entered index of the maximum word in the fib1 variable that represents its even indexes and fib2 representing the odd string indexes. 
* lab3 - program that calculates the duration of declaring an int variable in a program written in C and a function written in assembler.
* lab4 - program that calculates the integral value of the function <b>f(x) = 2x + 4</b>. The arguments are: lower limit of integration, which is set in constant a, upper boundary in constant b and precision, i.e. number of division in constant prec of axis x. Result is written in variable result, which then copies the contents into the register %xmm0.
* lab5 - program calculating the integral of the function <b>f(x) = 2x + 4</b>. Then in the <b>main.c</b> program it is called as a function to calculate the integral with given parameters a, b and n. The function my_cpuid counting the time of the calculation operation is also included in the program. integrals in two cases. For <b>integrate(a, b, n)</b> and <b>integrate_sse(a, b, n)</b> functions.
* lab6 - program calculating cache access times (cache).

## Setup
To run this project for example to run lab3 project:

```
$ make my_cpuid
```

## Status
Project is: _finished_.

## Contact
Created by [@PJasiczek](https://www.piotrjasiczek.pl/) - feel free to contact me!