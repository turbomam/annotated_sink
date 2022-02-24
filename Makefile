.PHONY: all clean

all: clean

clean:
	rm -rf target/*yaml

target/person_with_hint.yaml: clean data/kitchen_sink.yaml
	yq '.classes.Person.annotations.display_hint = "display_me"' data/kitchen_sink.yaml
	#yq '.classes.Person.annotations.display_hint = "display_me"' $(word 2, $^) > $@
	## Error: write /dev/stdout: permission denied

target/pwh_gen.yaml: person_with_hint.yaml
	poetry run gen-yaml $< > $@