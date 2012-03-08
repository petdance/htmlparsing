# Perl uses HTML::Parser

The CPAN module [HTML::Parser][6]
is the basis for all HTML parsing in Perl.  There are other CPAN modules
that do parsing, but the vast majority of them are just wrappers around
HTML::Parser.

# xmlgrep

The [XML::Twig](http://search.cpan.org/dist/XML-Twig) module includes the
`xmlgrep` utility, which can often be good enough.  It doesn't parse,
but finds local matches.

# Marpa::HTML

[Marpa::HTML][1]
does "high-level" parsing of HTML.
It allows handlers to be specified for elements,
terminals and other components in the hierarchical structure of an HTML document.
[Marpa::HTML][1]
is a completely liberal HTML parser:
it never rejects a document,
no matter how poorly that document fits the HTML standards.

The parsing method [Marpa::HTML][1] uses is totally new,
as described in "How to Parse HTML",
Parts [1][2], [2][3] and [3][4].
Its [Marpa::XS][5] parse engine is in optimized C.

WWW::Mechanize
==============
[WWW::Mechanize][7] is a great module because it handles two common tasks associated with parsing HTML: fetching a remote document and extracting basic information from a document.

    # Fetch the document located at $url
    $mech->get( $url );

Calling the `get()` subroutine handles all the lower level work of using [LWP](https://metacpan.org/module/LWP) to fetch a page and then [HTML::Parser][6] to build up a useful object. This `$mech` object has numerous subroutines for accessing all of the data or in a piecemeal fashion.

    # Get the text from the current object
    my $text = $mech->text();
    
    # Return all links
    my $links = $mech->links();
    
    # Return all images
    my $images = $mech->images();
    
    # Fetch the page title
    my $title = $mech->title();

WWW::Mechanize also provides `find_all_links()` and `find_all_images()` for searching through all the links and images.

WWW::Mechanize::TreeBuilder
===========================
[WWW::Mechanize::TreeBuilder](https://metacpan.org/module/WWW::Mechanize::TreeBuilder) 
is a combination of [WWW::Mechanize][7] and
[WWW::TreeBuilder](https://metacpan.org/module/HTML::TreeBuilder) which 
brings the functionality of 
[HTML::Element](https://metacpan.org/module/HTML::Element) with it. Now it is 
possible to search by tag name or by attribute.

    use v5.10;
    use WWW::Mechanize;
    use WWW::Mechanize::TreeBuilder;

    my $mech = WWW::Mechanize->new;
    WWW::Mechanize::TreeBuilder->meta->apply($mech);
    
    $mech->get( 'http://htmlparsing.com/' );
    
    # fine all <h1> tags
    my @list = $mech->find('h1');
    
    # or this way
    my @list = $mech->look_down('_tag', 'h1');

    # Now just iterate and process
    foreach (@list) {
      say $_->as_text();
    }

`find()` searches by tag name whereas `look_down()` starts at `$mech` and 
looks thru its element descendants (in pre-order), looking for elements 
matching the criteria you specify. In the above example we are using the 
internal attribute value '_tag' to search for 'h1' tags only. `look_down()` 
can use HTML attribute names, values or be passed a coderef.


# To do

* Code examples
* Other modules than HTML::Parser

  [1]: https://metacpan.org/module/Marpa::HTML "Marpa::HTML"
  [2]: http://blogs.perl.org/users/jeffrey_kegler/2011/11/how-to-parse-html.html "How to Parse HTML 1"
  [3]: http://blogs.perl.org/users/jeffrey_kegler/2011/12/how-to-parse-html-part-2.html "How to Parse HTML 2"
  [4]: http://blogs.perl.org/users/jeffrey_kegler/2011/12/how-to-parse-html-part-3.html "How to Parse HTML 3"
  [5]: https://metacpan.org/module/Marpa::XS "Marpa::XS"
  [6]: http://search.cpan.org/dist/HTML-Parser/
  [7]: https://metacpan.org/module/WWW::Mechanize
