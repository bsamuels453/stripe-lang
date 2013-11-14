/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar stripe;

// starting point for parsing a stripe file
compilationUnit
    :   moduleDecl? importDecl* bodyDecl* EOF
    ;

// Three possible top-level declarations

moduleDecl
    :   'module' qualifiedName exportDecl? ';'
    ;

importDecl
    :   'import' qualifiedNameAndStar ';'
    |   'import' qualifiedName 'as' Identifier ';'
    ;

bodyDecl
    :   annotationList? annotableDecl ';'
    ;

// Content
// Export

exportDecl
    :   'where' '(' qualifiedNameAndStar (',' qualifiedNameAndStar)* ')'
    ;

// Annotations

annotationList
    :   annotation (',' annotation)*
    ;

annotation
    :   '@' annotationType ','
    ;

annotationType
    :   'pre'  '(' StringLiteral ')' '=' bodyExpr      #preAnnotation
    |   'post' '(' StringLiteral ')' '=' bodyExpr      #postAnnotation
    |   'inv'  '(' StringLiteral ')' '=' bodyExpr      #invAnnotation
    |   'doc'  '(' Identifier?   ')' '=' StringLiteral #docAnnotation
    ;

annotableDecl
    :   functionDecl
    |   structDecl
    |   enumDecl
    |   classDecl
    |   fieldDecl
    ;

// Function

functionDecl
    :   bindingDecl
    ;

bindingDecl
    :   Identifier unnamedBindingDecl
    ;

unnamedBindingDecl
    : parameterList? typeQualification? bodyExprAssign
    ;

bodyExprAssign
    : '=' bodyExpr
    ;

classDecl
    :   'class' Identifier '=' '{' bodyDecl* '}'
    ;

structDecl
    :   'struct' Identifier '=' '{' structBodyDecl* '}'
    ;

structBodyDecl
    :    structBodyMember (',' structBodyMember)*
    ;

structBodyMember
    :   annotationList? annotableDecl
    ;

fieldDecl
    :   Identifier ':' typeQualifier
    ;

enumDecl
    :   'enum' Identifier '=' Identifier (',' Identifier)*
    ;

bodyExpr
    :   valueContent                                        #valueExpr
    |   bodyExpr '.' Identifier                             #elementExpr
    //|   bodyExpr '[' bodyExpr ']' TODO not sure, array?
    |   bodyExpr '(' valueList? ')'                         #funCallExpr
    //|   bodyExpr ':' type TODO not sure
    //|   ('~'|'!') bodyExpr TODO not sure
    |   bodyExpr ('*'|'/'|'%') bodyExpr                     #mulExpr
    |   bodyExpr ('+'|'-') bodyExpr                         #addExpr
    |   bodyExpr ('++') bodyExpr                            #appendExpr
    |   bodyExpr ('<''<'|'>''>') bodyExpr                   #bitshiftExpr
    |   bodyExpr ('<='|'>='|'>'|'<') bodyExpr               #boolCompareExpr
    |   bodyExpr ('=='|'!=') bodyExpr                       #boolEqExpr
    |   bodyExpr '&' bodyExpr                               #binAndExpr
    |   bodyExpr '^' bodyExpr                               #binXorExpr
    |   bodyExpr '|' bodyExpr                               #binOrExpr
    |   bodyExpr '&&' bodyExpr                              #boolAndExpr
    |   bodyExpr '||' bodyExpr                              #boolOrExpr
    |   bodyExpr '?' bodyExpr ':' bodyExpr                  #ternaryExpr
    |   'if' bodyExpr 'then' bodyExpr 'else' bodyExpr       #ifExpr
    |   'match' valueList 'in' matches*                     #matchExpr
    |   'guard' valueList 'in' guards*                      #guardExpr
    |   'let' bindingDecl (',' bindingDecl)* 'in' bodyExpr  #letExpr
    |   '{' makeObjInit? makeObjList* '}'                   #makeObjExpr
    ;

matches
    :   matchEntry (',' matchEntry)*
    ;

matchEntry
    :   valueList '=' bodyExpr
    ;

guards
    :   guardEntry (',' guardEntry)*
    ;

guardEntry
    :   bodyExpr '=' bodyExpr
    ;

makeObjInit
    :   valueContent '|'
    ;

makeObjList
    :   makeObjEntry (',' makeObjEntry)*
    ;

makeObjEntry
    :   Identifier '=' bodyExpr
    ;



// Params

parameterList
    :   '(' parameterMember? ')'
    ;

parameterMember
    :   typeableParameterMember (',' typeableParameterMember)*
    ;

typeableParameterMember
    :   Identifier typeQualification?
    ;

typeQualification
    :   ':' typeQualifier
    ;

// Values

valueList
    :   '(' valueMember? ')'
    |   valueContent
    ;

valueMember
    :   valueContent (',' valueContent)*
    ;

valueContent
    :   '(' bodyExpr ')'
    |   'this'
    |   '_'
    |   literal
    |   contextLiteral
    |   Identifier
    ;

// Qualified names and types

qualifiedName
    :   Identifier ('.' Identifier)*
    ;

qualifiedNameAndStar
    :   qualifiedName ('.' '*')?
    ;

typeQualifier
    :   Identifier
    |   typeLiteral
    |   contextedTypeQualifier
    ;

contextedTypeQualifier
    :   contextLiteral contextedTypeQualifierTail+
    ;

contextedTypeQualifierTail
    :   Identifier
    |   typeLiteral
    |   '(' contextedTypeQualifier ')'
    ;

// Literals

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
    |   SignalLiteral
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
STRUCT        : 'struct';

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
AS            : 'as';

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

// Containers Literals, ignore should never be used here tho, TODO split em
/*
TupleLiteral
    :   '(' parametersValAndIgnore? ')'
    ;

ListLiteral
    :   '[' parametersValAndIgnore? ']'
    ;

DictLiteral
    :   '{' DictLiteralEntry? (',' DictLiteralEntry)* '}'
    ;

DictLiteralEntry
    :   parametersValAndIgnore ':' parametersValAndIgnore
    ;
*/
// Context literals
// TODO figure out how to handle this, not hardcoded

MaybeLiteral
    :   'Just'
    |   'Nothing'
    |   'Maybe'
    ;

EitherLiteral
    :   'Left'
    |   'Right'
    |   'Either'
    ;

SignalLiteral
    :   'Signal'
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
ANNOTATION      : '@';
APPEND          : '++';

// Identifiers

Identifier
    : StripeLetter StripeLetterOrDigit*
    ;

fragment
StripeLetter
    : [a-zA-Z] // This will be used for functions, vars
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

