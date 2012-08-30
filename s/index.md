# "I need a regular expression to parse my HTML"

New programmers who want to extract information from an HTML document
often turn to regular expressions.

This is rarely a good idea.  HTML is an irregular language and regexes
are inadequate for the job.  You should use an HTML parser.

This site shows you how.

# Why **regexes** are bad for **HTML parsing**

* [This answer on stackoverflow](http://stackoverflow.com/questions/1732348/regex-match-open-tags-except-xhtml-self-contained-tags/1732454#1732454) is a good starting point.
* [This post by Tom Christiansen](http://stackoverflow.com/questions/4231382/regular-expression-pattern-not-matching-anywhere-in-string/4234491#4234491) shows that **you can parse HTML with regex**. The solution is neither easy to comprehend/debug/extend nor practical when you have dedicated libraries to do the **HTML parsing** as alternatives.



# To do

* Add more languages.
* More explanations of why regexes are bad.
* More explanations of how fragile regexes are.

# Thanks

Thanks to the following folks for their contributions:

* Kirk Kimmel
* Anubhava Srivastava
* Nathan Mahdavi
* Jeffrey Kegler
* Bill Ricker
* Stuart Caie
* and Jeana Clark
