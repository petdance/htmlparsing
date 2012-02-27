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

# Notes

http://stackoverflow.com/questions/292926/robust-mature-html-parser-for-php
