
NR==2 {

    match($0, /\(([^)]+)\)/)
    ip = substr($0, RSTART + 1, RLENGTH - 2)
}

NR==5 {
   
    host = $0
    gsub("Hosted by ", "", host)
    split(host, arr, ":")
    host = arr[1]
    ping = arr[2]
    gsub(" ", "", ping)
}

NR==7 {
    download = $2 " " $3
}

NR==9 {
    upload = $2 " " $3
}

END {
    date = strftime("%m/%d/%Y %H:%M:%S", systime())
    print  date " | " ping " | " download " | "  upload " | " ip  " | " host
}