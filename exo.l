%{
#include "exo.tab.h"
%}

%option noyywrap
N  [+-]?([0-9]*[.])?[0-9]+
L  [a-zA-Z]
d  "/"
m  "*"
a  "+"
s  "-"
p  "^"
p1 "("
p2 ")"
e  "="
espace  " "
fin ";"
%%

{N} yylval.TypeCaract=atoi(yytext); return n;
{L} yylval.TypeCaract=yytext[0];return l;
{d} return d;
{m} return m;
{a} return a;
{s} return s;
{p} return p;
{p1} return p1;
{p2} return p2;
{e} return e;
{espace} ;
{fin} return 0;
\n ;
.        yylval.TypeCaract=yytext[0]; return carinvalide;


%%
