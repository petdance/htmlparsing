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


# Notes

http://stackoverflow.com/questions/292926/robust-mature-html-parser-for-php
