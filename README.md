Description:
============

Basic Business Letter generated with Apache FOP


Dependencies
------------
* pandoc
* xmllint
* saxon
* apache-fop


Example
-------
Example PDF Business Letter generated with Apache FOP

```
    cd example
    ../letter.sh -t ../src/main/resources/letter.db -z ../src/main/resources/ -s sender.xml -r recipient.xml -b body.rst -c closing.xml -x /tmp/letter.xml -f /tmp/letter.fo -p letter.pdf
```
