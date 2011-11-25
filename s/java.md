The important point about Java HTML parsing is to use a parser designed
for it. While you can parse HTML using the default XML parser, it's a
brittle thing because it will only accept well formed, strict XHTML.


# TagSoup library

Hence, I highly recommend using the TagSoup library which slots right
into the parsing framework but handles crappy HTML.

<pre>
import java.net.URL;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;
import org.ccil.cowan.tagsoup.jaxp.SAXParserImpl;

public class HTMLParseExample {
    public static void main(String args[]) throws Exception {

        // print the 'src' attributes of &lt;img> tags
        // from http://www.yahoo.com/
        // using the TagSoup parser

        SAXParserImpl.newInstance(null).parse(
            new URL("http://www.yahoo.com/").openConnection().getInputStream(),
            new DefaultHandler() {
                public void startElement(String uri, String localName,
                                         String name, Attributes a)
                {
                    if (name.equalsIgnoreCase("img"))
                        System.out.println(a.getValue("src"));
                }
            }
        );
    }
}
</pre>

# Xerces

And here's a slightly more complex example (collect and print the text
inside nested `<p>` tags), this time using the standard Java XML parser
Xerxes instead of TagSoup.

<pre>
import java.net.URL;
import java.util.ArrayList;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.helpers.DefaultHandler;

public class XHTMLParseExample {
    public static void main(String args[]) throws Exception {

        // print the text in &lt;p> ... &lt;/p> tags on http://www.w3.org/
        // using the standard Java XML parser, Xerxes

        javax.xml.parsers.SAXParserFactory.newInstance().newSAXParser().parse(
            new URL("http://www.w3.org/").openConnection().getInputStream(),
            new DefaultHandler() {
                ArrayList&lt;StringBuilder> p = new ArrayList&lt;StringBuilder>();

                public void startElement(String uri, String localName,
                                         String name, Attributes a)
                {
                    // push a string buffer for every &lt;p> tag
                    if (name.equalsIgnoreCase("p")) {
                        p.add(new StringBuilder());
                    }
                }

                public void endElement(String uri, String localName, String name)
                {
                    // pop and print a string buffer for every &lt;/p> tag
                    if (name.equalsIgnoreCase("p")) {
                        int lastIdx = p.size() - 1;
                        System.out.print("PARA: " + p.remove(lastIdx));
                    }
                }

                public void characters(char[] ch, int start, int length) {
                    // append any characters to the current string buffer
                    int lastIdx = p.size() - 1;
                    if (lastIdx > -1) {
                        p.get(lastIdx).append(new String(ch, start, length))
                                      .append(' ');
                    }
                }

                // if we don't include a fake resolveEntity() method, Xerxes
                // will try to download the entity URI listed its cached DTD:
                // http://www.w3.org/TR/xhtml1/DTD/xhtml-lat1.ent
                public InputSource resolveEntity(String publicId, String systemId)
                    throws org.xml.sax.SAXException, java.io.IOException
                {
                    final String fake = "&lt;!ENTITY nbsp \"&#160;\">";
                    return new InputSource(new java.io.StringReader(fake));
                }
            }
        );
    }
}
</pre>
