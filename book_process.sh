#!/bin/bash

FILE="book.txt"

echo "Convert all text to lowercase:"
echo "========================================================"
lower_text=$(cat "$FILE" | tr '[:upper:]' '[:lower:]')
echo "$lower_text"
echo

echo "Remove punctuation:"
echo "========================================================"
clean_text=$(echo "$lower_text" | tr -d '[:punct:]')
echo "$clean_text"
echo

echo "Count the frequency of each unique word:"
echo "============================================"
echo "$clean_text" | tr ' ' '\n' | grep -v '^$' | sort | uniq -c | sort -nr
echo

echo "Extract the top 10 most frequently used words with the number of times they have appeared:"
echo "=============================================================="
echo "$clean_text" | tr ' ' '\n' | grep -v '^$' | sort | uniq -c | sort -nr | head -n 10
echo

echo "Count how many words are in each sentence:"
echo "=============================================="
sentences=$(cat "$FILE" | tr '\n' ' ' | sed 's/[.!?]/&\n/g')

echo "$sentences" | while read -r sentence; do
    word_count=$(echo "$sentence" | tr -s ' ' '\n' | grep -v '^$' | wc -l)
    echo "Words: $word_count - Sentence: $sentence"
done
echo

echo "Display only the sentences that have more than 10 words:"
echo "==================================================="
echo "$sentences" | while read -r sentence; do
    word_count=$(echo "$sentence" | tr -s ' ' '\n' | grep -v '^$' | wc -l)
    if [ "$word_count" -gt 10 ]; then
        echo "Words: $word_count - Sentence: $sentence"
    fi
done
echo

echo "Find the average number of words per sentence:"
echo "================================================="
total_words=$(echo "$sentences" | tr -s ' ' '\n' | grep -v '^$' | wc -l)
total_sentences=$(echo "$sentences" | grep -c '^')
average=$(echo "scale=2; $total_words / $total_sentences" | bc)
echo "Average words per sentence: $average"
