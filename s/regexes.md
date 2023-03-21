# You should probably not be using regular expressions

* HTML is not regular
* Regexes may match today, but what about tomorrow?

Say you've got a file of HTML where you're trying to extract URLs from
&lt;img&gt; tags.

    <img src="http://example.com/whatever.jpg">

So you write a regex like this (in [Perl](/perl.html)):

    if ( $html =~ /<img src="(.+)"/ ) {
        $url = $1;
    }

In this case, `$url` will indeed contain
`http://example.com/whatever.jpg`.  But what happens when
you start getting HTML like this:

    <img src='http://example.com/whatever.jpg'>

or

    <img src=http://example.com/whatever.jpg>

or

    <img border=0 src="http://example.com/whatever.jpg">

or

    <img
        src="http://example.com/whatever.jpg">

or you start getting false positives from

    <!-- <img src="http://example.com/outdated.png"> -->

# Don't reinvent the wheel

Parsers are pieces of code that already work, already have been tested.

Your regex probably doesn't have everything worked out.
Parsers have solutions for edge cases built in.

# Why not parse with regexes?

You can't reliably parse HTML with regexes.  Regular expressions are a
tool that is insufficiently sophisticated to understand the constructs
employed by HTML. HTML is not a regular language and hence cannot be
parsed by regular expressions. Regex queries are not equipped to break
down HTML into its meaningful parts.  HTML is a language of sufficient
complexity that it cannot be parsed by regular expressions.

In addition, the performance of regular expressions can be
unpredictable, and a few small tweaks to the expression may
unexpectedly result in much worse performance (depending on the
expression, the language, and engine).  This is particularly true when
using features such as positive or negative lookahead or lookbehind,
which might be desireable for HTML parsing tasks.
