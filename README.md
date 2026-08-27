# Common Lisp for Zed

Syntax highlighting for Common Lisp. Nothing else.

## Installing

This extension is not in the Zed registry, so it installs as a dev extension. Start by going to where you want to clone the repo. Then run:

```
git clone https://github.com/bi3mer/zed-cl-syntax-highlighting.git
```

Open the command palette (`ctrl-shift-p`, or `cmd-shift-p` on macOS), run `zed: install dev extension`, and select the directory you just cloned, the one holding `extension.toml`. Zed clones the pinned grammar, downloads wasi-sdk, compiles the parser to wasm, and loads the queries, so the first install needs network access. Nothing has to be installed beforehand: the extension ships no Rust, so Zed never runs `cargo`, and it fetches its own wasm toolchain.

To confirm the install, open `test/dense.lisp`. The status bar should read `Common Lisp` and the buffer should be colored.

After editing `config.toml` or any `.scm` file, run `zed: rebuild dev extension`. That command stays hidden from the palette until a dev extension is installed. If highlighting disappears after an edit, read `zed: open log`. Tree-sitter compiles each query file as a unit, so one bad pattern, such as a node name the grammar does not define, takes the whole file down with it.

## Grammar

The grammar is from [tree-sitter-grammars/tree-sitter-commonlisp](https://github.com/tree-sitter-grammars/tree-sitter-commonlisp). [highlights.scm](languages/common-lisp/highlights.scm) is a port of the nvim-treesitter query for the same grammar. The header comment in that file lists every change made for Zed and why.
