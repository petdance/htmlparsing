# Perl uses HTML::Parser

The CPAN module [HTML::Parser](http://search.cpan.org/dist/HTML-Parser/)
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

# To do

* Code examples
* Other modules than HTML::Parser
* Mention WWW::Mechanize which takes care of the common parsing needs.

  [1]: https://metacpan.org/module/Marpa::HTML "Marpa::HTML"
  [2]: http://blogs.perl.org/users/jeffrey_kegler/2011/11/how-to-parse-html.html "How to Parse HTML 1"
  [3]: http://blogs.perl.org/users/jeffrey_kegler/2011/12/how-to-parse-html-part-2.html "How to Parse HTML 2"
  [4]: http://blogs.perl.org/users/jeffrey_kegler/2011/12/how-to-parse-html-part-3.html "How to Parse HTML 3"
  [5]: https://metacpan.org/module/Marpa::XS "Marpa::XS"
