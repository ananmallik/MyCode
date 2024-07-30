process.stdin.on("data", (data) => {
	const name = data.toString().trim() 
	if (name !== "") {
			process.stdout.write(`Hello ${name}!`); } 
		else {
			process.stderr.write("Input was empty."); }
});