# Lex-YACC-simple-calculator

calc.l and calc.y to parse programs whose syntax is defined below.

Prog->main() {Stmts}
Stmts->ε | Stmt; Stmts
Stmt->Id = E | Id *= E | Id += E | print E
E->Integer | Id | E * E | E + E | (-Integer)
Integer -> digit+

Prog is a program that contains one main function.

Stmts is empty or a sequence of statements separated using ;

Integer is either a positive integer, or a negative integer enclosed in “(“ and “)”

Id is an identifier, which is a sequence of one or more lower-case letters or digits. In addition, Id should start with a lower-case letters. For example, x, x1, xy are identifiers, but 1x and A are not.

Expression E is an integer, an identifier, or an infix arithmetic expression with operators "*" and "+". These two operators are left associative (e.g., 1 + 2 + 3 is equivalent to (1 + 2) + 3). "*" has higher precedence than “+”.

Id = E assigns the value of an expression E to the variable Id, Id *= E assigns Id * E to Id, and Id += E assigns Id + E to Id. println E outputs the value of the expression E. Assume that Id is already assigned a value prior to the execution of Id *= E and Id += E.

If there is any syntax error, you are expected to interpret the program until the statement where you find the error. Also, your error message must contain the line number where the error was found.
Tokens may be separated by any number of white spaces, tabs, or new lines.


To compile:
- flex calc.l;
- bison -dv calc.y;
- gcc -o calc calc.tab.c lex.yy.c

To run :
- ./calc < input 
  (where input is name of input file)
