- The name and the email address of group members
  Kasturi Vartak
  kvartak2@binghamton.edu

  Onkar Kulkarni
  okulkar4@binghamton.edu

- Whether your code was tested on bingsuns or remote.cs.
  remote.cs

- How to execute your program.
  To compile:
  ->  make
    OR
  ->  flex calc.l;
      bison -dv calc.y;
      gcc -o calc calc.tab.c lex.yy.c

  To run :
  ->  ./calc < input (where input is name of input file)
