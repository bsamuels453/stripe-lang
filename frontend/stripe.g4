/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar stripe;

// starting point for parsing a stripe file
compilationUnit
    :   moduleDeclaration? importDeclaration* bodyDeclaration* EOF
    ;

moduleDeclaration
    :   'module' qualifiedName exportDeclaration? ';'
    ;

exportDeclaration
    :   'where' '(' qualifiedNameAndStar (',' qualifiedNameAndStar)* ')'
    ;

importDeclaration
    :   'import' qualifiedNameAndStar ';'
    ;

bodyDeclaration
    :   bindingDeclaration
    |   classDeclaration
    |   functionDeclaration
    ;

bindingDeclaration
    :   Identifier bindingParameters? '=' bodyExpr ';'
    ;

bindingParameters
    :   '(' bindingParameterList? ')'
    ;

bindingParameterList
    :   Identifier (',' Identifier)*
    ;

classDeclaration
    :   'class' TypeIdentifier '{' classBodyExpr* '}' ';'
    ;

functionDeclaration
    :   Identifier functionParameters? ':' typeQualifier '{' functionBodyExpr* '}' ';'
    ;

functionParameters
    :   '(' functionParameterList? ')'
    ;

functionParameterList
    :   typedQualifiedName? (',' typedQualifiedName)*
    ;

classBodyExpr
    :   'inv' '(' StringLiteral ')' '=' bodyExpr ';'
    |   'doc' '(' StringLiteral ')' '=' bodyExpr ';'
    |   bindingDeclaration
    |   functionDeclaration
    |   fieldDeclaration
    ;

fieldDeclaration
    :   Identifier ':' typeQualifier ';'
    ;

functionBodyExpr
    :   'pre'  '(' StringLiteral ')' '=' bodyExpr ';'
    |   'post' '(' StringLiteral ')' '=' bodyExpr ';'
    |   'doc'  '(' StringLiteral ')' '=' bodyExpr ';'
    |   'body' ':' bindingParameters? '=' bodyExpr ';'
    ;

bodyExpr
    :   primary
    |   bodyExpr '.' Identifier
    |   bodyExpr '[' bodyExpr ']'
    |   bodyExpr '(' bodyExpr? ')'
    //|   bodyExpr ':' type TODO not sure
    |   ('~'|'!') bodyExpr
    |   bodyExpr ('*'|'/'|'%') bodyExpr
    |   bodyExpr ('+'|'-') bodyExpr
    |   bodyExpr ('<''<'|'>''>') bodyExpr
    |   bodyExpr ('<='|'>='|'>'|'<') bodyExpr
    |   bodyExpr ('=='|'!=') bodyExpr
    |   bodyExpr '&' bodyExpr
    |   bodyExpr '^' bodyExpr
    |   bodyExpr '|' bodyExpr
    |   bodyExpr '&&' bodyExpr
    |   bodyExpr '||' bodyExpr
    |   bodyExpr '?' bodyExpr ':' bodyExpr
    |   'if' bodyExpr 'then' bodyExpr 'else' bodyExpr
    |   'match' '{' bindingDeclaration* '}' ';'
    |   'guard' '{' bindingDeclaration* '}' ';'
    |   'let' bindingDeclaration (',' bindingDeclaration)* 'in' bodyExpr
    ;

primary
    :   '(' bodyExpr ')'
    |   'this'
    |   literal
    |   Identifier
    ;

// Qualified names, identifier, literals

qualifiedName
    :   AnyIdentifier ('.' AnyIdentifier)*
    ;

qualifiedNameAndStar
    :   qualifiedName ('.' '*')?
    ;

qualifiedNameOrUnderscore
    :   qualifiedName
    |   '_'
    ;

typedQualifiedName
    :   Identifier ':' typeQualifier
    ;

typeQualifier
    :   TypeIdentifier
    |   typeLiteral
    |   contextedTypeQualifier
    ;

contextedTypeQualifier
    :   contextLiteral contextedTypeQualifierTail+
    ;

contextedTypeQualifierTail
    :   TypeIdentifier
    |   typeLiteral
    |   '(' contextedTypeQualifier ')'
    ;

typeLiteral
    :   'Bool'
    |   'Byte'
    |   'Char'
    |   'Double'
    |   'Float'
    |   'Int'
    |   'Long'
    |   'Short'
    |   'Void' // TODO keep?
    ;

contextLiteral
    :   MaybeLiteral
    |   EitherLiteral
    ;

literal
    :   IntegerLiteral
    |   FloatingPointLiteral
    |   CharacterLiteral
    |   StringLiteral
    |   BooleanLiteral
    ;

// LEXER

// Keywords

// Keywords - Types

BOOL          : 'Bool';
BYTE          : 'Byte';
CHAR          : 'Char';
DOUBLE        : 'Double';
FLOAT         : 'Float';
INT           : 'Int';
LONG          : 'Long';
SHORT         : 'Short';
VOID          : 'Void'; // TODO keep?

// Keywords - Contexts

MAYBE         : 'Maybe';
EITHER        : 'Either';
SIGNAL        : 'Signal';

// Keywords - Others

VMCALL        : 'vmcall';

PRE           : 'pre';
POST          : 'post';
INV           : 'inv';
DOC           : 'doc';
BODY          : 'body';

LET           : 'let';
IN            : 'in';

MATCH         : 'match';
GUARD         : 'guard';

THIS          : 'this';
CLASS         : 'class';

ENUM          : 'enum';

CASE          : 'case';
OF            : 'of';

IF            : 'if';
THEN          : 'then';
ELSE          : 'else';

IMPORT        : 'import';
EXPORT        : 'export';
MODULE        : 'module';
WHERE         : 'where';

// Integer Literals

IntegerLiteral
    :   DecimalIntegerLiteral
    |   HexIntegerLiteral
    |   OctalIntegerLiteral
    |   BinaryIntegerLiteral
    ;

fragment
DecimalIntegerLiteral
    :   DecimalNumeral IntegerTypeSuffix?
    ;

fragment
HexIntegerLiteral
    :   HexNumeral IntegerTypeSuffix?
    ;

fragment
OctalIntegerLiteral
    :   OctalNumeral IntegerTypeSuffix?
    ;

fragment
BinaryIntegerLiteral
    :   BinaryNumeral IntegerTypeSuffix?
    ;

fragment
IntegerTypeSuffix
    :   [lL]
    ;

fragment
DecimalNumeral
    :   '0'
    |   NonZeroDigit (Digits? | Underscores Digits)
    ;

fragment
Digits
    :   Digit (DigitOrUnderscore* Digit)?
    ;

fragment
Digit
    :   '0'
    |   NonZeroDigit
    ;

fragment
NonZeroDigit
    :   [1-9]
    ;

fragment
DigitOrUnderscore
    :   Digit
    |   '_'
    ;

fragment
Underscores
    :   '_'+
    ;

fragment
HexNumeral
    :   '0' [xX] HexDigits
    ;

fragment
HexDigits
    :   HexDigit (HexDigitOrUnderscore* HexDigit)?
    ;

fragment
HexDigit
    :   [0-9a-fA-F]
    ;

fragment
HexDigitOrUnderscore
    :   HexDigit
    |   '_'
    ;

fragment
OctalNumeral
    :   '0' Underscores? OctalDigits
    ;

fragment
OctalDigits
    :   OctalDigit (OctalDigitOrUnderscore* OctalDigit)?
    ;

fragment
OctalDigit
    :   [0-7]
    ;

fragment
OctalDigitOrUnderscore
    :   OctalDigit
    |   '_'
    ;

fragment
BinaryNumeral
    :   '0' [bB] BinaryDigits
    ;

fragment
BinaryDigits
    :   BinaryDigit (BinaryDigitOrUnderscore* BinaryDigit)?
    ;

fragment
BinaryDigit
    :   [01]
    ;

fragment
BinaryDigitOrUnderscore
    :   BinaryDigit
    |   '_'
    ;

// Floating-Point Literals

FloatingPointLiteral
    :   DecimalFloatingPointLiteral
    ;

fragment
DecimalFloatingPointLiteral
    :   Digits '.' Digits? ExponentPart? FloatTypeSuffix?
    |   '.' Digits ExponentPart? FloatTypeSuffix?
    |   Digits ExponentPart FloatTypeSuffix?
    |   Digits FloatTypeSuffix
    ;

fragment
ExponentPart
    :   ExponentIndicator SignedInteger
    ;

fragment
ExponentIndicator
    :   [eE]
    ;

fragment
SignedInteger
    :   Sign? Digits
    ;

fragment
Sign
    :   [+-]
    ;

fragment
FloatTypeSuffix
    :   [fFdD]
    ;

fragment
HexSignificand
    :   HexNumeral '.'?
    |   '0' [xX] HexDigits? '.' HexDigits
    ;

// Boolean Literals
// TODO figure out how to handle this, not hardcoded

BooleanLiteral
    :   'True'
    |   'False'
    ;

// Context literals
// TODO figure out how to handle this, not hardcoded

MaybeLiteral
    :   'Just'
    |   'Nothing'
    ;

EitherLiteral
    :   'Left'
    |   'Right'
    ;

// Character Literals

CharacterLiteral
    :   '\'' SingleCharacter '\''
    |   '\'' EscapeSequence '\''
    ;

fragment
SingleCharacter
    :   ~['\\]
    ;

// String Literals

StringLiteral
    :   '"' StringCharacters? '"'
    ;

fragment
StringCharacters
    :   StringCharacter+
    ;

fragment
StringCharacter
    :   ~["\\]
    |   EscapeSequence
    ;

// Escape Sequences for Character and String Literals

fragment
EscapeSequence
    :   '\\' [btnfr"'\\]
    |   OctalEscape
    |   UnicodeEscape
    ;

fragment
OctalEscape
    :   '\\' OctalDigit
    |   '\\' OctalDigit OctalDigit
    |   '\\' ZeroToThree OctalDigit OctalDigit
    ;

fragment
UnicodeEscape
    :   '\\' 'u' HexDigit HexDigit HexDigit HexDigit
    ;

fragment
ZeroToThree
    :   [0-3]
    ;
// Separators

LPAREN          : '(';
RPAREN          : ')';
LBRACE          : '{';
RBRACE          : '}';
LBRACK          : '[';
RBRACK          : ']';
SEMI            : ';';
COLON           : ':';
COMMA           : ',';
DOT             : '.';

// Arithmetic operators

ADD             : '+';
SUB             : '-';
MUL             : '*';
DIV             : '/';
MOD             : '%';

// Bit operators

BITOR           : '|';
BITAND          : '&';
TILDE           : '~'; // not
CARET           : '^'; // xor
LSHIFT          : '<<';
RSHIFT          : '>>';

// Boolean operators

OR              : '||';
AND             : '&&';
BANG            : '!';
GT              : '>';
LT              : '<';
LE              : '<=';
GE              : '>=';
EQUAL           : '==';
NOTEQUAL        : '!=';

// Assignment

ASSIGN          : '=';
MATCHASSIGN     : '=>';

// Other

TERNARY         : '?';
IGNORE          : '_';


// Identifiers

AnyIdentifier
    : StripeLetterOrDigit*
    ;

Identifier
    : StripeLetter StripeLetterOrDigit*
    ;

TypeIdentifier
    : StripeCapLetter StripeLetterOrDigit*
    ;

fragment
StripeCapLetter
    : [A-Z] // This will be used for new typenames (class, struct, enum, etc)
    ;

fragment
StripeLetter
    : [a-z] // This will be used for functions, vars
    ;

fragment
StripeLetterOrDigit
    : [a-zA-Z0-9_] // This will be any other chatacter in an identifier
    ;

// Extra

WS
    : [ \t\r\n\u000C]+ -> skip
    ;

COMMENT
    : '/*' .*? '*/' -> skip
    ;

LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;
