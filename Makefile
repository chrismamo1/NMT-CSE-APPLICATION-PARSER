app_processor: app_processor.ml
	ocamlfind ocamlc -syntax camlp4o -linkpkg -package cow,cow.syntax,csv -linkpkg app_processor.ml -o app_processor
