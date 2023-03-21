HTML parsing in .Net is accomplished using one of two popular open-source libraries: [AngleSharp][1] or [HtmlAgilityPack][2]. Of the two, AngleSharp is currently maintained, while HtmlAgilityPack is based off of Microsoft's older XPathNavigator technology and rarely updated.

[1]: https://github.com/AngleSharp/AngleSharp
[2]: https://htmlagilitypack.codeplex.com/

# AngleSharp

Install via Nuget.

    Install-Package AngleSharp

AngleSharp uses CSS-style selectors.

To get the contents of a tag:

    using AngleSharp.Parser.Html;

   	var htmlDoc = new HtmlParser(html).Parse();
    var bodyTag = htmlDoc.QuerySelector("body");
	var bodyContents bodyTag.InnerHtml;

To change an attribute value on a tag:

    var h1Tag = htmlDoc.QuerySelector("h1");
	h1Tag.SetAttribute("class", "newClass");

To iterate over nodes:

    foreach(var anchor in htmlDoc.QuerySelectorAll("a"))
    { ... }

# HtmlAgilityPack

Install via NuGet.

    Install-Package HtmlAgilityPack

HtmlAgilityPack uses XPath-style selectors. In most cases, there is a direct correlation to the standard XML library (XmlDocument = HtmlDocument, XmlAttribute = HtmlAttribute, etc.)

To get the contents of a tag:

    using HtmlAgilityPack;

	var htmlDoc = new HtmlDocument();
    htmlDoc.LoadHtml(html);
    var bodyTag = htmlDoc.DocumentNode.SelectSingleNode("//body");
    var bodyContents = bodyTag.InnerHtml;

To change an attribute value on a tag:

    var h1Tag = htmlDoc.DocumentNode.SelectSingleNode("//h1");
    h1Tag.SetAttributeValue("class", "newClass");

To iterate over nodes (note that you have to do a NULL check first, or you will get an exception if no nodes are found; also note the required explicit variable type declaration in the foreach loop):

    if(htmlDoc.DocumentNode.SelectNodes("//a") != null)
    {
	    foreach(HtmlNode anchor in htmlDoc.DocumentNode.SelectNodes("//a"))
	    { ... }
    }

Alternately, the NULL check can be skipped by using the null coalesce operation in the foreach loop to create an empty collection.

    foreach(HtmlElement anchor in htmlDoc.SelectNodes("//a") ?? new HtmlNodeCollection(htmlDoc.DocumentElement))
    {}
