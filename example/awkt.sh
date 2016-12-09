awk '{
	if(NR >= 3 && NR <7)
		print $0;
}' $1
