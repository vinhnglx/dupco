# Dupco

[![Build Status](https://travis-ci.org/vinhnglx/dupco.svg?branch=master)](https://travis-ci.org/vinhnglx/dupco)

Dupco is a simple tool to check duplicate content on a web page. In the first release, the tool can only check duplicate content from Viki - a global TV site.

![SAMPLE](https://cloud.githubusercontent.com/assets/1997137/23226387/536be84c-f970-11e6-826d-66a465037a0a.png)

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

