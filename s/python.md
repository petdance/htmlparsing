* [ElementTree](http://docs.python.org/2/library/xml.etree.elementtree.html) is part of the standard library.
* [Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/) is a popular 3rd-party library.
* [lxml](http://lxml.de/) is a fast and feature-rich C-based library.

ElementTree example:

    from xml.etree import ElementTree

    tree = ElementTree.parse('filename.html')
    for elem in tree.findall('table'):
            print ElementTree.tostring(elem)

Examples welcomed!
