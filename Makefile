app_processor: app_processor.ml
	ocamlfind ocamlc -syntax camlp4o -package cow,cow.syntax,csv,netstring -linkpkg app_processor.ml -o app_processor
