%let pgm=utl-count-of-three-word-phrases-in-a-paragraph-ngrams-nlp-ai;

Count of three word phrases in a paragraph ngrams nlp

github
https://tinyurl.com/4uwpkte5
https://github.com/rogerjdeangelis/utl-count-of-three-word-phrases-in-a-paragraph-ngrams-nlp

see
https://goo.gl/bCbmnc
http://stackoverflow.com/questions/43496348/text-mining-count-frequencies-of-phrases-more-than-one-word

Imran Ali profile
http://stackoverflow.com/users/923194/imran-ali

Related repos
https://github.com/rogerjdeangelis/utl_most_popular_common_words_in_three_shakespeare_plays
https://github.com/rogerjdeangelis/utl_how_to_find_the_union_and_intersection_of_words_in_two_strings_nlp
https://github.com/rogerjdeangelis/utl_natural_language_processing_nlp_in_r_identify_nouns_pronouns_adjectives
https://github.com/rogerjdeangelis/utl-google-trends-is-the-seach-word-increasing-in-popularity
https://github.com/rogerjdeangelis/utl-google-weekly-trends-for_2019-on-my-last-name-r-gtrendsr-package
https://github.com/rogerjdeangelis/utl-AI-spelling-corrector-when-word-is-close-to-the-correct-word
https://github.com/rogerjdeangelis/utl-AI-first-name-and-birth-date-range-to-gender

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/


/**************************************************************************************************************************/
/*                              |                                        |                                                */
/*         INPUT                |             PROCESS                    |                OUTPUT                          */
/*                              |                                        |                                                */
/*                              |                                        |                                                */
/* options validvarname=upcase; | %utl_rbegin;                           | ROWNAMES W1W2                FREQ LENGTH       */
/* libname sd1 "d:/sd1";        | parmcards4;                            |                                                */
/* data sd1.have;               | library(haven)                         |     1    How many pickled      1    16         */
/* text =compbl(                | library(tau)                           |     2    If Peter Piper        1    14         */
/* "Peter Piper picked a        | library(data.table)                    |     3    Peter Piper pick      1    16         */
/*  peck of pickled peppers.    | library(haven)                         |     4    Peter Piper picked    2    18         */
/*  If Peter Piper picked a     | source("c:/temp/fn_tosas9.R")          |     5    Piper pick if         1    13         */
/*  peck of pickled peppers,    | text<-read_sas("d:/sd1/have.sas7bdat") |     6    Piper picked a        2    14         */
/*  How many pickled peppers    |  createNgram <-function(stringVector   |     7    a peck of             3     9         */
/*  did Peter Piper pick        |    ,ngramSize){                        |     8    did Peter Piper       1    15         */
/*  if he picked a peck         |        ngram <- data.table()           |     9    he picked a           1    11         */
/*  of pickled peppers"         |        ng <- textcnt(stringVector      |    10    if he picked          1    12         */
/* );                           |        ,method = "string"              |    11    many pickled peppers  1    20         */
/* put text=;                   |        ,n=ngramSize                    |    12    of pickled peppers    3    18         */
/* run;quit;                    |        ,tolower = FALSE)               |    13    peck of pickled       3    15         */
/*                              |     if(ngramSize==1){                  |    14    peppers How many      1    16         */
/* SD1.HAVE total obs=1         |         ngram <- data.table(           |    15    peppers If Peter      1    16         */
/*                              |         w1 = names(ng)                 |    16    peppers did Peter     1    17         */
/*       TEXT                   |        ,freq = unclass(ng)             |    17    pick if he            1    10         */
/*                              |        ,length=nchar(names(ng)))       |    18    picked a peck         3    13         */
/* "Peter Piper picked a        |        }                               |    19    pickled peppers How   1    19         */
/*  peck of pickled peppers.    |     else {                             |    20    pickled peppers If    1    18         */
/*  If Peter Piper picked a     |         ngram <- data.table(           |    21    pickled peppers did   1    19         */
/*  peck of pickled peppers,    |         w1w2 = names(ng)               |                                                */
/*  How many pickled peppers    |        ,freq = unclass(ng)             |                                                */
/*  did Peter Piper pick        |        ,length=nchar(names(ng)))       |                                                */
/*  if he picked a peck         |        };                              |                                                */
/*  of pickled peppers"         |   return(ngram)                        |                                                */
/*                              |   };                                   |                                                */
/*                              | want <- createNgram(text, 3)           |                                                */
/*                              | fn_tosas9(dataf=want)                  |                                                */
/*                              | ;;;;                                   |                                                */
/*                              | %utl_rend;                             |                                                */
/*                              |                                        |                                                */
/*                              | libname tmp "c:/temp";                 |                                                */
/*                              | proc print data=tmp.want;              |                                                */
/*                              | run;quit;                              |                                                */
/*                              |                                        |                                                */
/**************************************************************************************************************************/


/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
text =compbl(
"Peter Piper picked a
 peck of pickled peppers.
 If Peter Piper picked a
 peck of pickled peppers,
 How many pickled peppers
 did Peter Piper pick
 if he picked a peck
 of pickled peppers"
);
put text=;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  SD1.HAVE total obs=1                                                                                                  */
/*                                                                                                                        */
/*        TEXT                                                                                                            */
/*                                                                                                                        */
/*  "Peter Piper picked a                                                                                                 */
/*   peck of pickled peppers.                                                                                             */
/*   If Peter Piper picked a                                                                                              */
/*   peck of pickled peppers,                                                                                             */
/*   How many pickled peppers                                                                                             */
/*   did Peter Piper pick                                                                                                 */
/*   if he picked a peck                                                                                                  */
/*   of pickled peppers"                                                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

 /*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

libname tmp "c:/temp";
proc datasets lib=tmp nolist nodetails;
 delete want;
run;quit;

%utl_rbegin;
parmcards4;
library(haven)
library(tau)
library(data.table)
library(haven)
source("c:/temp/fn_tosas9.R")
text<-read_sas("d:/sd1/have.sas7bdat")
 createNgram <-function(stringVector
   ,ngramSize){
       ngram <- data.table()
       ng <- textcnt(stringVector
       ,method = "string"
       ,n=ngramSize
       ,tolower = FALSE)
    if(ngramSize==1){
        ngram <- data.table(
        w1 = names(ng)
       ,freq = unclass(ng)
       ,length=nchar(names(ng)))
       }
    else {
        ngram <- data.table(
        w1w2 = names(ng)
       ,freq = unclass(ng)
       ,length=nchar(names(ng)))
       };
  return(ngram)
  };
want <- createNgram(text, 3)
fn_tosas9(dataf=want)
;;;;
%utl_rend;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*   ROWNAMES    W1W2                    FREQ    LENGTH                                                                   */
/*                                                                                                                        */
/*       1       How many pickled          1       16                                                                     */
/*       2       If Peter Piper            1       14                                                                     */
/*       3       Peter Piper pick          1       16                                                                     */
/*       4       Peter Piper picked        2       18                                                                     */
/*       5       Piper pick if             1       13                                                                     */
/*       6       Piper picked a            2       14                                                                     */
/*       7       a peck of                 3        9                                                                     */
/*       8       did Peter Piper           1       15                                                                     */
/*       9       he picked a               1       11                                                                     */
/*      10       if he picked              1       12                                                                     */
/*      11       many pickled peppers      1       20                                                                     */
/*      12       of pickled peppers        3       18                                                                     */
/*      13       peck of pickled           3       15                                                                     */
/*      14       peppers How many          1       16                                                                     */
/*      15       peppers If Peter          1       16                                                                     */
/*      16       peppers did Peter         1       17                                                                     */
/*      17       pick if he                1       10                                                                     */
/*      18       picked a peck             3       13                                                                     */
/*      19       pickled peppers How       1       19                                                                     */
/*      20       pickled peppers If        1       18                                                                     */
/*      21       pickled peppers did       1       19                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
