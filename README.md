# CardPrinter

A general purpose library for generating PDFs which can be printed on 6x4
index cards.

## Installation

The recommended way is to just install the gem, this will also add a
`card_printer` command:

    $ gem install card_printer

If you use `rbenv` to manage ruby versions, remember to:

    $ rbenv rehash

after installing the gem.

## Usage

You can use the card printer as a stand-alone binary.

```
$ card_printer
```

Invoked with no arguments you'll see usage instructions.

```
Usage: card_printer [options] <output file.pdf>
Options:
    -p=, parser    Choose input parser (one of 'csv', 'json_lines', 'trello_json_export', default: trello_json_export)
    -r=, renderer  Choose layout renderer (one of '6x4', 'a6', 'a5', default: '6x4')
    -h=            display this help message
```

Typical usage would be:

1. export data from your trello board ([instructions](http://help.trello.com/article/747-exporting-data-from-trello-1)) which saves a file such as `aI48isTv.json`
2. Run it using the shell `<` operator to provide the input data:

    ```
    $ card_printer output.pdf < aI48isTv.json
    ```

3. Done! Open `output.pdf`

## Input formats

The `card_printer` accepts three types of data format as input:

* csv - should have headers matching the expected field names
* json_lines - JSON Lines format with one card per line
* trello_json_export (default) - direct [export of the whole board in json format](http://help.trello.com/article/747-exporting-data-from-trello-1)

for the `csv` and `json_lines` formats the stories can have the following fields:
  * name (required) - main story title
  * story_type - determines the colour of the border {feature|bug|chore|other}
  * estimate - number shown in bottom left corner
  * label - shown in bottom right of card (use for tags or epic names)
  * id - shown in bottom centre of card

for the `trello_json_export` format the data will be used in the following way:

  - name - taken from the card title
  - story type - taken from name of the trello label (using substring match for 'feature/bug/chore' defaults to 'other')
  - estimate - not extracted at present
  - label - not extracted at present
  - id - extracts the [short ID](https://trello.com/c/OvKHeqvC/1003-short-ids-for-cards) of the trello card.

## About trello short IDs

This is a new feature in Trello, and doesn't appear to work fully as
described. I couldn't find a way to link to or directly open a trello card
using its short ID, although searching using the short id within your board
does seem to find the card (but also other apparently unrelated things).

You can also use this bookmarklet to reveal the card short ids on your board:

```javascript
javascript:(function(){$(".card-short-id").removeClass("hide")})())
```

To add it to your browser:

1. copy the above javascript code (including `javascript:`)
2. right click on your browser bookmarks toolbar
3. select 'add page' or 'add bookmark'
4. enter a name such as 'Show card IDs'
5. in the URL field paste the javascript code

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
