function touch {
    param(
        [Parameter(Mandatory = $true)]
        [string]$FilePath
    )
    "" >> $FilePath
}
