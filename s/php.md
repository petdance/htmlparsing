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

# A simple program to extract Google result links

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

    # Parse the HTML from Google
    @$dom->loadHTML($html);

    # Iterate over all the <a> tags
    foreach($dom->getElementsByTagName('a') as $link) {
            # Show the <a href>
            echo $link->getAttribute('href');
            echo "<br />";
    }
    ?>

# Notes

http://stackoverflow.com/questions/292926/robust-mature-html-parser-for-php
