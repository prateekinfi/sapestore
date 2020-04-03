function alignment() {
	var leftCol= document.getElementById('leftColId');
	var rightCol= document.getElementById('mainContent');
	var rightHeight = rightCol.offsetHeight;
	var leftHeight = leftCol.offsetHeight;
	console.log(rightHeight)
	console.log(leftHeight)
	if (leftHeight < rightHeight) {
		leftCol.style.height = rightHeight + 'px';
	} else {
		rightCol.style.offsetHeight = leftHeight + 'px';
	}
}