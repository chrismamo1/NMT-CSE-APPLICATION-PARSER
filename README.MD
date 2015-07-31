#NMT CSE APPLICATION PARSER

This application loads the applications (as a CSV) and produces a group of HTML documents which are convenient for reviewing the applications.

for this to work, you must have the spreadsheet (as a CSV) from google forms. However, the default spreadsheet from google forms is pretty thoroughly
lurgied up, and you need to make a few changes to it. I would have uploaded the fixed version, but Github repos are public.

#How to Run
1. Make sure you have the following:
    *OCaml>4.02.2
    *Clone these files to a directory
    *Have the spreadsheat from google forms (as a CSV)
2. In order to successfully compile and run this, perform the following commands:
```
sudo apt-get install ocaml opam
opam update
opam install cow csv
eval `opam config env`
```
You might also need to install Netstring/Netencode (for URL encoding), but I'm
reasonably confident that this comes with the OCaml distribution.
3. run `ocamlfind ocamlopt -syntax camlp4o -package cow,cow.syntax,csv,netstring -linkpkg app_processor.ml -o app_processor` for an optimized native-code
   executable, or use the makefile for an OCaml byte code executable
4. run `app_processor --help` for usage instructions

NOTE: the output directory must exist before you run the program
