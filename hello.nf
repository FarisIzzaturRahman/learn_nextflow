params.str = 'Hello World!'

process splitLetters{
    output:
    file 'chunk_*' into letter

    script:
    """
    printf '${params.str}' | split -b 6 - chunk_
    """
}

process convertToUpper{
    input:
    file x from letters.flatten()

    output:
    stdout result

    script:
    """
    cat $x | tr '[a-z]' '[A-Z]'
    """
}

result.view { it.trim()}