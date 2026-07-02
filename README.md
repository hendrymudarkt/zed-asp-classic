# ASP Classic for Zed

ASP Classic (VBScript) language support for the [Zed editor](https://zed.dev).

## Features

- **Syntax Highlighting** untuk file `.asp` dan `.asa`
- **Code Snippets** untuk konstruksi VBScript yang umum
- Mendukung:
  - `<% ... %>` — ASP code block
  - `<%= ... %>` — Inline expression
  - `<%@ ... %>` — ASP directive
  - `<!--#include file="..." -->` — Server-side includes
  - Keyword VBScript lengkap (If/For/Sub/Function/Class dll.)
  - Built-in objects: `Response`, `Request`, `Server`, `Session`, `Application`
  - Built-in functions VBScript (Trim, Left, Mid, DateAdd, dll.)
  - HTML injection (HTML di luar ASP tags dihighlight sebagai HTML)

## Instalasi

### Sebagai Dev Extension (local)

1. Clone kedua repo ini:
   ```bash
   git clone https://github.com/your-username/tree-sitter-asp-classic
   git clone https://github.com/your-username/zed-asp-classic
   ```

2. Build tree-sitter grammar:
   ```bash
   cd tree-sitter-asp-classic
   npm install
   npx tree-sitter generate
   ```

3. Di Zed, buka Command Palette (`Ctrl+Shift+P`) → `zed: install dev extension`
4. Pilih folder `zed-asp-classic`

### Via Zed Extension Registry (setelah publish)

Buka Extensions (`Ctrl+Shift+X`) → cari "ASP Classic" → Install.

## Snippets

| Prefix | Deskripsi |
|--------|-----------|
| `asp` | ASP code block `<% %>` |
| `rw` | `Response.Write` |
| `rwi` | Inline `<%= %>` |
| `if` | If...Then...End If |
| `ife` | If...Else...End If |
| `for` | For...Next |
| `foreach` | For Each...In...Next |
| `while` | While...Wend |
| `do` | Do While...Loop |
| `sub` | Sub declaration |
| `func` | Function declaration |
| `select` | Select Case |
| `oern` | On Error Resume Next |
| `co` | Server.CreateObject |
| `rf` | Request.Form |
| `rqs` | Request.QueryString |
| `adoconn` | ADODB.Connection block |
| `adorec` | ADODB.Recordset loop |
| `asphead` | Standard ASP page header |

## Struktur Repo

```
zed-asp-classic/
├── extension.toml          # Zed extension manifest
└── languages/
    └── asp-classic/
        ├── config.toml     # Language config (.asp, .asa)
        ├── highlights.scm  # Syntax highlight queries
        └── snippets.json   # Code snippets

tree-sitter-asp-classic/    # Repo grammar terpisah
├── grammar.js              # Tree-sitter grammar definition
├── package.json
└── queries/
    ├── highlights.scm
    ├── injections.scm      # HTML injection untuk non-ASP content
    └── locals.scm
```

## Cara Publish ke Zed Registry

1. Push `tree-sitter-asp-classic` ke GitHub
2. Push `zed-asp-classic` ke GitHub
3. Update `extension.toml` dengan `rev` dari commit SHA grammar:
   ```bash
   git -C tree-sitter-asp-classic rev-parse HEAD
   ```
4. Fork [zed-industries/extensions](https://github.com/zed-industries/extensions)
5. Tambahkan sebagai submodule:
   ```bash
   git submodule add https://github.com/your-username/zed-asp-classic.git extensions/asp-classic
   ```
6. Buat PR ke zed-industries/extensions

## License

MIT
