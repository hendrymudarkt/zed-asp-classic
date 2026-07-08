; ASP Classic syntax highlighting queries
;
; Keywords / builtin functions / builtin objects / builtin properties /
; builtin constants each have their OWN token type in the grammar (see
; grammar.js: `keyword`, `function_builtin`, `type_builtin`,
; `property_builtin`, `constant_builtin`), matched with higher lexer
; precedence than the generic `identifier` token. So this file just maps
; each node type straight to a capture -- no #match? regex needed anymore.

; === ASP Delimiters ===
"<%" @punctuation.special
"%>" @punctuation.special
"<%=" @punctuation.special
"<%@" @punctuation.special

; === Keywords / builtins (distinct node types from the grammar) ===
(keyword) @keyword
(keyword_modifier) @keyword.modifier
(function_builtin) @function
(type_builtin) @type
(property_builtin) @property
(constant_builtin) @constant

; === Strings / Numbers / Comments ===
(string) @string
(number) @number
(comment) @comment

; === Operators / Punctuation ===
(operator) @operator
(punctuation) @punctuation.delimiter

; === #include SSI directive ===
; Deliberately NOT highlighted (no captures), so it renders as plain/default
; text — like VS Code's text.html.asp, where <!--#include ...--> looks black
; (like a comment visually) but is not parsed as one. It is its own grammar
; node, so the HTML injection does not treat it as an HTML comment either.

; === Plain identifiers (variables, function/sub names, everything else) ===
(identifier) @variable
