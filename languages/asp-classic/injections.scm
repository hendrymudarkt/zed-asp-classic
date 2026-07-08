; Re-parse the raw HTML text (everything outside <% %> blocks) as a SINGLE
; fragment with Zed's bundled HTML grammar. Because a complete <style>…</script>
; element lives inside one `html` node, the HTML grammar sees it as a whole
; element and injects CSS and JavaScript into it itself — matching VS Code's
; text.html.basic behavior that the jtjoo extension builds on. The #include SSI
; directive is excluded (it is its own node in the grammar) so it is NOT
; treated as an HTML comment.
((html) @injection.content
  (#set! injection.language "html"))
