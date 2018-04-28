# Perl word pair parser

First build the image `docker build -t perl .`.
Run the image `docker run -v <localpath>:/app -it perl`.
Don't forget to change `<localpath>` to path of the `app` folder.


To parse the lorem text: `perl loremParser.pl`
You will find the result in the `lorem.result.txt` file

To parse the Alice book: `perl bookParser.pl`
You will find the result in the `book.result.txt` file

Both .pl files are the same with just different input and output files.