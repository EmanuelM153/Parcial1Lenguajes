/^+$/ {
	printf "suma\n"
}

/^+\+$/ {
	printf "incr\n"
}

/^[0-9]+$/ {
	printf "entero\n"
}

/^([0-9]+)\.([0-9]+)$/ {
	printf "real\n"
}
