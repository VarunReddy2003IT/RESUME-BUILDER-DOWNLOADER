window.onload= function(){
	document.getElementById("download")
	.addEventListener("click",()=>{
		const pdf = this.document.body;
		console.log(pdf);
		console.log(window);
		html2pdf().from(pdf).save();
	})
}