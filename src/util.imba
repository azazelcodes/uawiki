export def capitalize(s)
	let fs = []
	for w in s.replaceAll('_', ' ').split(' ')
		fs.push(w.charAt(0).toUpperCase() + w.slice(1).toLowerCase())
	return fs.join(' ');