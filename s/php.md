# PHP uses DOM

HTML parsing in PHP is done with the
[DOM module](http://php.net/manual/en/book.dom.php).

    $dom = new DOMDocument;
    $dom->loadHTML($html);
    $images = $dom->getElementsByTagName('img');
    foreach ($images as $image) {
            $image->setAttribute('src', 'http://example.com/' . $image->getAttribute('src'));
    }
    $html = $dom->saveHTML();

Here's an example for pulling out any `<a>` tags with the `nofollow` attribute:

    $doc = new DOMDocument();
    libxml_use_internal_errors(true);
    $doc->loadHTML($html); // loads your HTML
    $xpath = new DOMXPath($doc);
    // returns a list of all links with rel=nofollow
    $nlist = $xpath->query("//a[@rel='nofollow']");

## A simple DOM program to extract Google result links

    <?php

    # Use the Curl extension to query Google and get back a page of results
    $url = "http://www.google.com";
    $ch = curl_init();
    $timeout = 5;
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $html = curl_exec($ch);
    curl_close($ch);

    # Create a DOM parser object
    $dom = new DOMDocument();

    # Parse the HTML from Google.
    # The @ before the method call suppresses any warnings that
    # loadHTML might throw because of invalid HTML in the page.
    @$dom->loadHTML($html);

    # Iterate over all the <a> tags
    foreach($dom->getElementsByTagName('a') as $link) {
            # Show the <a href>
            echo $link->getAttribute('href');
            echo "<br />";
    }
    ?>

# simple\_html\_dom

The [simple\_html\_dom][simple_html_dom] module is an alternative to
the built-in-DOM module.  Since it is a third-party module, you'll have
to install it yourself.

[simple_html_dom]: http://simplehtmldom.sourceforge.net/ "simple_html_dom homepage"

## Modifying links with simple\_html\_dom

Say you have some links in your HTML file that look like this:

    <a class="someclass" href="/some/file.html">

and you want to convert them to:

    <a class="someclass" href="http://www.example.com/some/file.html">

but only the ones with a class of "someclass".  Here's a program to
do that:

    $html = new simple_html_dom();
    $html->load($input);

    foreach($html->find('a[class=someclass]') as $link)
        $link->href = 'http://www.example.com' . $link->href;

    $result = $html->save();

`find` lets you easily query the DOM. The parameter is
`tagtype[attributeName=attributeValue]` where the square brackets are
an optional filter. Then you just iterate over every link this function
finds, and prepend the href attribute with your domain.  The `href`
function is both a getter and setter.

## Extracting text with simple\_html\_dom

A common task is to remove all tag markup from a page of HTML, leaving
only the text.  This is simple:

    echo file_get_html('http://www.google.com/')->plaintext;

# More alternative parsers for PHP

[This thread on StackOverflow](http://stackoverflow.com/questions/3577641/how-to-parse-and-process-html-xml-with-php)
discusses a number of different parsing tools available for PHP.
