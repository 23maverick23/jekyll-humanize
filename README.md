# jekyll-humanize

This began as a port of the Django app `humanize` which adds a "human touch" to data. Each method represents a Fluid type filter that can be used in your Jekyll site templates. Given that Jekyll produces static sites, some of the original methods do not make logical sense to port (e.g. naturaltime).

## Installation

Simply download the `humanize.rb` file and place it in the `_plugins` directory of your Jekyll site.

## Usage

Each of the methods in the file presents an available Fluid type filter to be used in Jekyll templates.

There is one **optional** setting that can be overridden in your `_config.yml` file. The setting should follow the format below and should be a valid `strftime` date string. Documentation on `strftime` can be found at [www.ruby-doc.com][2].

```yaml
humanize:
    date_format: "%m/%d/%Y"
```

### ordinal(_value_, _flag="super"_)

Converts an integer to its ordinal as a string. 1 is '1st', 2 is '2nd', 3 is '3rd', etc. Works for any integer. An optional flag can be added which puts the ordinal suffix in `<sup></sup>` tags.

```ruby
{{ somenum }} >>> 3
{{ somenum | ordinal }} >>> '3rd'
{{ somenum | ordinal: "super" }} >>> '3<sup>rd</sup>'
```

### intcomma(_value_, _delimiter=","_)

Converts an integer to a string containing commas every three digits. For example, 3000 becomes '3,000' and 45000 becomes '45,000'. Optionally supports a delimiter override for commas (if you wanted to use periods for European numerical separators).

```ruby
{{ post.content | number_of_words }} >>> 12345
{{ post.content | number_of_words | intcomma }} >>> '12,345'
{{ post.content | number_of_words | intcomma: '.' }} >>> '12.345'
```

### intword(_value_)

Converts a large integer to a friendly text representation. Works best for numbers over 1 million. For example, 1000000 becomes '1.0 million'. 1200000 becomes '1.2 million' and 1200000000 becomes '1.2 billion'.

```ruby
{{ largenum }} >>> 1200000
{{ largenum | intword }} >>> '1.2 million'
```

### apnumber(_value_)

For numbers 0-9, returns the number spelled out. Otherwise, returns the number. This follows the Associated Press style.

```ruby
{{ num }} >>> 6
{{ num | apnumber }} >>> 'six'
```

### naturalday(_date_)

For date values that are within a 9 day stretch from present day, this will attempt to return the string representation in the format of today, tomorrow, yesterday, "in # days" or "# days ago". Otherwise, returns a string formatted according to the `date_format` setting in your `_config.yml` file using strftime format. If not defined, it will default to `%m/%d/%Y`.

```ruby
# TODAY == '01/26/2014'
{{ post.updated }} >>> 01/25/2014
{{ post.updated | naturalday }} >>> 'yesterday'
{{ post.date }} >>> 01/19/2014
{{ post.date | naturalday }} >>> 'seven days ago'
```

### filesize(_bytes_)

For filesize values in bytes, returns the number rounded to 3 decimal places with the correct suffix.

```ruby
{{ bytes }} >>> 123456789
{{ bytes | filesize }} >>> 117.738 MB
```

## License

[LICENSE](LICENSE)

#### Django Humanize

Copyright (c) Django Software Foundation and individual contributors.
All rights reserved.

Source code for the original Django app can be viewed at [https://github.com/django/django][1].

#### JS-humanize

Filesize format forked from javascript to ruby from [https://github.com/milanvrekic/JS-humanize][3]

## Changelog

[CHANGELOG](CHANGELOG.md)

Issues
------

[![Issue Stats](http://issuestats.com/github/23maverick23/jekyll-humanize/badge/issue?style=flat)](http://issuestats.com/github/23maverick23/jekyll-humanize)

You can log issues from the menu at right, or by [clicking here](https://github.com/23maverick23/jekyll-humanize/issues). Curious about responsiveness? Check out our [Issue Stats](http://issuestats.com/github/23maverick23/jekyll-humanize)!

Contribute
----------

[![Issue Stats](http://issuestats.com/github/23maverick23/jekyll-humanize/badge/pr?style=flat)](http://issuestats.com/github/23maverick23/jekyll-humanize)

1. [Fork](https://github.com/23maverick23/jekyll-humanize/fork) this repo.
2. Create a branch `git checkout -b my_feature`
3. Commit your changes `git commit -am "Added Feature"`
4. Push to the branch `git push origin my_feature`
5. Open a [Pull Request](https://github.com/23maverick23/jekyll-humanize/pulls)

[1]: https://github.com/django/django
[2]: http://www.ruby-doc.org/core-2.1.0/Time.html#method-i-strftime
[3]: https://github.com/milanvrekic/JS-humanize
