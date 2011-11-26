# Perl uses HTML::Parser

The CPAN module [HTML::Parser](http://search.cpan.org/dist/HTML-Parser/)
is the basis for all HTML parsing in Perl.  There are other CPAN modules
that do parsing, but the vast majority of them are just wrappers around
HTML::Parser.

# xmlgrep

The [XML::Twig](http://search.cpan.org/dist/XML-Twig) module includes the
`xmlgrep` utility, which can often be good enough.  It doesn't parse,
but finds local matches.

# To do

* Code examples
* Other modules than HTML::Parser
* Mention WWW::Mechanize which takes care of the common parsing needs.
