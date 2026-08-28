; Bracket pairs for Zed: match highlighting, jump-to-pair, and (when
; `colorize_brackets` is on) rainbow bracket colorization by nesting depth.
;
;   - Parentheses are the only bracket pair this grammar emits. list_lit,
;     defun, and _bare_list_lit all carry open/close fields typed as the "("
;     and ")" anonymous tokens.
;   - Vector literals need no pattern of their own. vec_lit is
;     seq('#', optional(/\d+[aA]/), list_lit), so the parens in #(1 2 3) are
;     ordinary list_lit parens.
;   - The "{" and "}" tokens exist only in _bare_map_lit and _bare_set_lit,
;     inherited from tree-sitter-clojure. Neither is Common Lisp, so a
;     ("{" @open "}" @close) pattern is dead and was removed.
;   - String delimiters get match highlighting but opt out of colorization:
;     a quote is not a nesting level.

("(" @open ")" @close)

(("\"" @open "\"" @close) (#set! rainbow.exclude))
