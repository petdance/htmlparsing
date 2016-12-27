.PHONY: \
	crank \
	clean

BUILD=build
SOURCE=s

default: crank

clean:
	rm -fr $(BUILD)

crank: clean
	mkdir -p $(BUILD)/ || true > /dev/null 2>&1
	./crank --sourcepath=$(SOURCE) --buildpath=$(BUILD)
	cp -R static/* $(BUILD)/

test: crank
	prove t/html.t

# This is only useful for Andy
rsync: crank
	rsync -azu -e ssh --delete --verbose \
	    $(BUILD)/ andy@alex.petdance.com:/srv/htmlparsing
