#!/usr/bin/sh

BASE=~/.letter
TEMPLATE=~/.letter/letter.db
SENDER=~/.letter/sender.xml
RECIPIENT=recipient.xml
CLOSING=~/.letter/closing.xml
BODY=body.xml
XML=letter.xml
FOP=letter.fo
PDF=letter.pdf

OPTS=`getopt -o tsrbxfcpz: --long template,sender,recipient,body,xml,fop,closing,pdf:base -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

while true; do
  case "$1" in
    -t|--template ) TEMPLATE="$2"; shift; shift ;;
    -s|--sender) SENDER="$2"; shift; shift ;;
    -r|--recipient) RECIPIENT="$2"; shift; shift ;;
    -b|--body) BODY="$2"; shift; shift ;;
    -x|--xml) XML="$2"; shift; shift ;;
    -f|--fop) FOP="$2"; shift; shift;;
    -c|--closing) CLOSING="$2"; shift; shift ;;
    -p|--pdf) PDF="$2"; shift; shift ;;
    -z|--base) BASE="$2"; shift; shift ;;
    --) shift; break ;;
    *) break ;;
  esac
done

echo "########################################"
echo "# Template: $TEMPLATE"
echo "# Sender: $SENDER"
echo "# Recipient: $RECIPIENT"
echo "# Body: $BODY"
echo "# XML: $XML"
echo "# FOP: $FOP"
echo "# Closing: $CLOSING"
echo "# PDF: $PDF"
echo "# BASE: $BASE"
echo "########################################"

rm $XML -rf
rm $FOP -rf

#pandoc --template $TEMPLATE -B $SENDER -B $RECIPIENT -A $CLOSING -o $XML -f rst $BODY
pandoc --template $TEMPLATE -B $SENDER -B $RECIPIENT -A $CLOSING -o $XML -t plain $BODY
xmllint --encode UTF-8 --format $XML --output $XML
saxon -s:$XML -xsl:$BASE/xsl/letter.xsl -o:$FOP
$FOP_HOME/fop -fo $FOP -pdf $PDF -c $BASE/fop.xconf