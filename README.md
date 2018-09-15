# mixtapes

Download counts of celebrated mixtapes hosted on [DatPiff](http://www.datpiff.com).

Data
----

Mixtapes scraped from the [celebrated](http://www.datpiff.com/mixtapes/celebrated) section of the DatPiff website, home to mixtapes that meet criteria for the following categories:

- gold (100k+ d/ls)
- platinum (250k+ d/ls)
- double-platinum (500k+ d/ls)

Data in .csv format, found in `/raw-data`.

Codebook:

-   `artist` (name of artist)
-   `title` (title of project)
-   `downloads` (download count, at time of scrape)
-   `link` (mixtape sub-page URL)
-   `scrape_time` (date at time of scrape)

Code
----

All source code found in `/src`.