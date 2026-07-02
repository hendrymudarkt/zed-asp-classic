; ASP Classic syntax highlighting queries for Zed
; Mirrors tree-sitter-asp-classic/queries/highlights.scm

; === ASP Delimiters ===
(asp_directive) @tag
(asp_expression
  "<%=" @tag
  "%>" @tag)
(asp_block
  "<%" @tag
  "%>" @tag)

; === VBScript Keywords ===
((identifier) @keyword
  (#match? @keyword "^(?i)(dim|set|if|then|else|elseif|end|for|each|in|to|step|next|while|wend|do|loop|until|select|case|sub|function|with|exit|on|error|resume|goto|call|new|nothing|null|empty|true|false|not|and|or|xor|eqv|imp|mod|is|like|public|private|const|redim|preserve|byval|byref|optional|paramarray|class|property|get|let|typeof|execute|executeglobal|option|explicit|rem)$"))

; === ASP Built-in Objects ===
((identifier) @type.builtin
  (#match? @type.builtin "^(?i)(Response|Request|Server|Session|Application|ObjectContext|ASPError)$"))

; === ASP Collections ===
((identifier) @property
  (#match? @property "^(?i)(Form|QueryString|Cookies|ServerVariables|Files|Contents|StaticObjects)$"))

; === VBScript Built-in Functions ===
((identifier) @function.builtin
  (#match? @function.builtin "^(?i)(Abs|Array|Asc|Atn|CBool|CByte|CCur|CDate|CDbl|Chr|CInt|CLng|Cos|CreateObject|CSng|CStr|Date|DateAdd|DateDiff|DatePart|DateSerial|DateValue|Day|Erase|Exp|Filter|Fix|FormatCurrency|FormatDateTime|FormatNumber|FormatPercent|GetObject|Hex|Hour|InStr|InStrRev|Int|IsArray|IsDate|IsEmpty|IsNull|IsNumeric|IsObject|Join|LBound|LCase|Left|Len|Log|LTrim|Mid|Minute|Month|MonthName|Now|Oct|Replace|Right|Rnd|Round|RTrim|Second|Sgn|Sin|Space|Split|Sqr|StrComp|StrReverse|String|Tan|Time|Timer|TimeSerial|TimeValue|Trim|TypeName|UBound|UCase|VarType|Weekday|WeekdayName|Year|CVar|Val)$"))

; === Object Method Calls ===
(member_expression "." @punctuation.delimiter (identifier) @function.method)

; === Strings ===
(string) @string

; === Numbers ===
(number) @number

; === Boolean/Special Literals ===
(boolean_literal) @constant.builtin
(null_literal) @constant.builtin
(nothing_literal) @constant.builtin
(empty_literal) @constant.builtin

; === Comments ===
(comment) @comment

; === Operators ===
[
  "=" "<>" "<" ">" "<=" ">="
  "+" "-" "*" "/" "\\" "^"
  "&"
] @operator

; === Punctuation ===
["(" ")"] @punctuation.bracket
[","] @punctuation.separator

; === #include ===
(include_directive
  "#include" @keyword.import
  (string) @string.special)

; === Sub/Function Names ===
(sub_declaration name: (identifier) @function)
(function_declaration name: (identifier) @function)

; === Variables ===
(identifier) @variable
