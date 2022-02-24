.PHONY: all clean

all: clean
	echo all

clean:
	echo clean

generated.yaml: clean
	pwd
	ls -l /home/mark/gitrepos/annotated_sink/data/core.yaml
	poetry run gen-yaml data/kitchen_sink.yaml
