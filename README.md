# Dupco

Dupco is a simple tool to check duplicate content on a web page. In the first release, the tool can only check duplicate content from Viki - a global TV site.

## Getting Started

Run `./runner` and see the result

![DEMO](http://g.recordit.co/HYRLJdAot5.gif)

## Notes

- Each website will have a different html/css structure, so if you guys need to check a new page, please create new class for parsing content.
In this case, I wrote the VikiRaw class to parsing content from Viki.

- Bug reports and pull requests are welcome on GitHub at https://github.com/vinhnglx/dupco.

- The tool requires Ruby version >= 2.1.0

## License

This library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

