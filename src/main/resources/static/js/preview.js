function preview() {
	frame.src = URL.createObjectURL(event.target.files[0]);
	document.getElementById('photoFileName').value = event.target.files[0].name;
	document.getElementById('msg').textContent = "";
}