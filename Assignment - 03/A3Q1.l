/*Count Positive, Negative, fractions(both +ve and -ve) numbers from a text file (input.txt) and output would be stored in (output.txt)*/

%{
    int postiveno=0;
	int negtiveno=0;
	int positivefractions=0;
	int negativefractions=0;


%}
DIGIT [0-9]

/* Rule Section */

%%
\+?{DIGIT}+			 postiveno++;
-{DIGIT}+			 negtiveno++;

\+?{DIGIT}*\.{DIGIT}+ positivefractions++;
-{DIGIT}*\.{DIGIT}+	 negativefractions++;
.   fprintf(yyout, "%s", yytext);
%%


int yywrap()
{
	return 1;
}

/* code section */
int main()
{
		extern FILE *yyin, *yyout;
		
		/* open the input file
		in read mode */
	yyin=fopen("input.txt", "r");

		/* open the output file
		in write mode */
	yyout=fopen("output.txt", "w");
	
		yylex();
}
