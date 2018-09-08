/**
 * 
 */

const table = document.getElementById("mytable");
const tr = table.rows;
const select = document.querySelector('.custom-select');

select.addEventListener('change', (event) => {
	if (event.target.value === 'Pass'){
		for(let i=1; i<tr.length; i++) {
			console.log(tr.item(i).cells.item(3).textContent);
			if (tr.item(i).cells.item(3).textContent === 'Pass') {
				tr.item(i).style.display = '';
			}else {
				tr.item(i).style.display = 'none';
			}
		}
	} else if (event.target.value === 'Fail'){
		for(let i=1; i<tr.length; i++) {
			if (tr.item(i).cells.item(3).textContent === 'Fail') {
				tr.item(i).style.display = '';
			}else {
				tr.item(i).style.display = 'none';
			}
		}
	 } else {
		for(let i=1; i<tr.length; i++) {
			tr.item(i).style.display = '';
		}
	}
});