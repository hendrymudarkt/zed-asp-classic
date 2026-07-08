; ASP Classic syntax highlighting queries
; Grammar is token-oriented (not a full statement AST), so keywords,
; built-in objects, and built-in functions are all distinguished from
; plain identifiers via regex match here.
;
; Zed resolves capture names right-to-left against the active theme: it
; tries the rightmost capture first, and falls back to the next one to the
; left if the theme doesn't define a style for it. We use common, widely
; supported capture names (@keyword, @string, @number, @comment, @function,
; @type, @variable, @constant, @operator, @punctuation) to make sure this
; actually renders with color in most themes, rather than more obscure
; captures like @function.builtin or @property that many themes leave
; unstyled (falling back to plain foreground/white).

; === ASP Delimiters ===
"<%" @punctuation.special
"%>" @punctuation.special
"<%=" @punctuation.special
"<%@" @punctuation.special

; === VBScript Keywords ===
((identifier) @keyword
  (#match? @keyword "^(?i)(Dim|Set|If|Then|Else|ElseIf|End|For|Each|In|To|Step|Next|While|Wend|Do|Loop|Until|Select|Case|Sub|Function|With|Exit|On|Error|Resume|GoTo|Call|New|Public|Private|Const|ReDim|Preserve|ByVal|ByRef|Optional|ParamArray|Class|Property|Get|Let|TypeOf|Execute|ExecuteGlobal|Option|Explicit|Rem|Is|Like|Mod|Not|And|Or|Xor|Eqv|Imp)$"))

; === Boolean / Special literals (matched as identifiers) ===
((identifier) @constant
  (#match? @constant "^(?i)(True|False|Null|Nothing|Empty)$"))

; === ASP Built-in Objects ===
((identifier) @type
  (#match? @type "^(?i)(Response|Request|Server|Session|Application|ObjectContext|ASPError)$"))

; === VBScript / ASP Built-in Functions & Methods ===
((identifier) @function
  (#match? @function "^(?i)(Abs|Array|Asc|Atn|CBool|CByte|CCur|CDate|CDbl|Chr|CInt|CLng|Cos|CreateObject|CSng|CStr|Date|DateAdd|DateDiff|DatePart|DateSerial|DateValue|Day|Erase|Exp|Filter|Fix|FormatCurrency|FormatDateTime|FormatNumber|FormatPercent|GetObject|Hex|Hour|InStr|InStrRev|Int|IsArray|IsDate|IsEmpty|IsNull|IsNumeric|IsObject|Join|LBound|LCase|Left|Len|Log|LTrim|Mid|Minute|Month|MonthName|Now|Oct|Replace|Right|Rnd|Round|RTrim|Second|Sgn|Sin|Space|Split|Sqr|StrComp|StrReverse|String|Tan|Time|Timer|TimeSerial|TimeValue|Trim|TypeName|UBound|UCase|VarType|Weekday|WeekdayName|Year|CVar|Val|Write|Redirect|MapPath|HTMLEncode|URLEncode|Open|Close|Execute|AddNew|Update|MoveNext|MoveFirst|MoveLast|MovePrevious)$"))

; === Strings ===
(string) @string

; === Numbers ===
(number) @number

; === Comments ===
(comment) @comment

; === Operators ===
(operator) @operator

; === Punctuation ===
(punctuation) @punctuation.delimiter

; === #include directive ===
(include_directive
  "#include" @keyword
  (string) @string)

; === Plain identifiers (variables, function/sub names, everything else) ===
(identifier) @variable

; === HTML content ===
(html_content) @none
(html_lt) @none
