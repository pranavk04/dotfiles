
# Show current time in given time zone, with completion of available time zones
# provided by `compleat/tz.usage`.
# XXX Add validation that `TZ` argument is passed, and is a valid time zone in
# `/usr/share/zoneinfo` (if it isn't get spurious results).
tz() {
    TZ="$1" date
}

alias sanfrancisco='tz America/Los_Angeles'
alias denver='tz America/Denver'
alias chicago='tz America/Chicago'
alias minnesota='chicago'
alias newyork='tz America/New_York'
alias london='tz Europe/London'

america() {
    echo "San Francisco:  $(sanfrancisco)"
    echo "Denver:         $(denver)"
    echo "Chicago:        $(chicago)"
    echo "New York:       $(newyork)"
}