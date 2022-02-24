.PHONY: all clean

all: clean

clean:
	rm -rf target/*yaml

# 	yq '.classes.Person.annotations.display_hint = "display_me"' data/kitchen_sink.yaml
# 	ls > ls.txt
# 	yq data/kitchen_sink.yaml > yq.yaml
	## Error: write /dev/stdout: permission denied
target/person_with_hint.yaml: clean data/kitchen_sink.yaml
	cp data/core.yaml target/core.yaml
	yq '.classes.Person.annotations.display_hint = "display_me"' $(word 2, $^) > $@

target/pwh_gen.yaml: target/person_with_hint.yaml
	poetry run gen-yaml $< > $@
	poetry run gen-project $< -d generated
