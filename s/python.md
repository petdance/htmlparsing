* [ElementTree](http://docs.python.org/2/library/xml.etree.elementtree.html) is part of the standard library.
* [Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/) is a popular 3rd-party library.
* [lxml](http://lxml.de/) is a fast and feature-rich C-based library.
* [twisted](http://twistedmatrix.com/documents/current/api/twisted.html) includes a DOM library [twisted.web.domhelpers](http://twistedmatrix.com/documents/10.2.0/api/twisted.web.domhelpers.html)

ElementTree example:

    from xml.etree import ElementTree

    tree = ElementTree.parse('filename.html')
    for elem in tree.findall('table'):
            print ElementTree.tostring(elem)

Examples welcomed!
